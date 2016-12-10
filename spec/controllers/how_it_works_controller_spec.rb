require "rails_helper"

describe HowItWorksController do
  describe "GET on #show" do
    before(:each) do
      @request.host = "app.lvh.me"
    end

    it "shows how it works" do
      user = create(:user)
      sign_in_as user

      get :show

      expect(response).to be_success
    end

    it "doesn't appear for non-logged in users" do
      get :show

      expect(response).to redirect_to sign_in_path
    end
  end
end
