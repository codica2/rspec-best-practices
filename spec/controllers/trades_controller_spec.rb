require "rails_helper"

describe TradesController do
  describe "GET on #show" do
    context "viewing a trade that doesn't belong to you" do
      it "redirects seller back to their trades page" do
        seller = create(:seller)
        create(:trade, seller: seller)
        other_sellers_trade = create(:trade)
        sign_in(seller.user)

        get :show, id: other_sellers_trade.id

        expect(controller).to set_flash[:notice].to(/not authorized/).now
        expect(response).to redirect_to trades_path
      end
    end
  end

  describe "PATCH on #update" do
    context "confirming a trade" do
      it "confirms the trade and marks the invoices as sold" do
        seller = create(:seller, accepted_terms: true)
        trade = create(:trade, seller: seller)
        create(:invoice, :approved, trade: trade, seller: seller)
        sign_in(seller.user)

        patch :update, id: trade.id

        expect(trade.reload.confirmed_at).not_to eq nil
        expect(trade.invoices.last.sold?).to eq true
        expect(response).to redirect_to trade_path(trade)
      end
    end
  end
end
