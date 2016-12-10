require "rails_helper"

describe SessionsController do
  describe "POST on #create" do
    context "with new registration state" do
      it "signs seller out after signing up with valid params" do
        seller = create(:seller, workflow_state: "new")
        seller.user.update(password: "Passw0rd")

        post :create, session: {
          email: seller.email,
          password: seller.user.password
        }

        expect(response).to redirect_to signed_out_root_path
        expect(flash[:warning]).to match(
          /^Your application is currently under review./
        )
      end
    end

    context "with business registration state" do
      it "redirects seller to business registration page" do
        seller = create(:seller, workflow_state: "business_registration")
        seller.user.update(password: "Passw0rd")

        post :create, session: {
          email: seller.email,
          password: seller.user.password
        }

        expect(response).to redirect_to(
          business_wizard_path
        )
      end
    end

    context "with customer registration state" do
      it "redirects seller to customer registration page" do
        seller = create(:seller, workflow_state: "customer_registration")
        seller.user.update(password: "Passw0rd")

        post :create, session: {
          email: seller.email,
          password: seller.user.password
        }

        expect(response).to redirect_to(
          customer_wizard_path
        )
      end
    end

    context "with completed registration state" do
      it "redirects seller to seller dashboard page" do
        seller = create(:seller, workflow_state: "completed")
        seller.user.update(password: "Passw0rd")

        post :create, session: {
          email: seller.email,
          password: seller.user.password
        }

        expect(response).to redirect_to(
          seller_dashboard_path
        )
      end
    end
  end
end
