require "rails_helper"

describe DebtorsController do
  describe "GET on #show" do
    context "viewing a debtor that doesn't belong to you" do
      it "redirects seller back to their debtors page" do
        seller = create(:seller)
        create(:debtor, seller: seller)
        other_sellers_debtor = create(:debtor)
        sign_in(seller.user)

        get :show, id: other_sellers_debtor.id

        expect(controller).to set_flash[:notice].to(/not authorized/).now
        expect(response).to redirect_to debtors_path
      end
    end
  end
end
