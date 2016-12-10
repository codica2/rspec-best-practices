require "rails_helper"

describe InvoicesController do
  describe "GET on #show" do
    context "viewing an invoice that doesn't belong to you" do
      it "redirects seller back to their invoices page" do
        seller = create(:seller)
        create(:invoice, seller: seller)
        other_sellers_invoice = create(:invoice)
        sign_in(seller.user)

        get :show, id: other_sellers_invoice.id

        expect(controller).to set_flash[:notice].to(/not authorized/).now
        expect(response).to redirect_to invoices_path
      end
    end
  end
end
