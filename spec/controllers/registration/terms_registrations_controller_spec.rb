require "rails_helper"

describe Registration::TermsRegistrationsController do
  describe "#create" do
    context "with valid params" do
      it "registers terms and sends a request for signature" do
        seller = create(:seller, workflow_state: "terms_registration")
        sign_in(seller.user)
        esignor = double("esignor", request_signature: true)
        allow(Esignature::Esignor).to receive(:new).with(any_args).
          and_return(esignor)

        post :create, registration_terms_registrar: registration_params

        expect(Esignature::Esignor).to have_received(:new).with(directors_params)
        expect(esignor).to have_received(:request_signature)
      end
    end

    context "with invalid params" do
      it "renders error messages" do
        seller = create(:seller, workflow_state: "terms_registration")
        sign_in(seller.user)

        post :create, registration_terms_registrar: invalid_registration_params

        expect(response).to render_template("new")
      end
    end
  end

  def registration_params
    {
      directors_name: "Test Name",
      directors_address: "Directors Address",
      directors_email: "valid@email.com",
      drivers_license_number: "12345",
      dob_day: "09",
      dob_month: "03",
      dob_year: "1985",
      accept_terms: "1",
      authorised_officer: "1"
    }
  end

  def invalid_registration_params
    {
      directors_name: "",
      directors_address: "",
      directors_email: "",
      drivers_license_number: "",
      dob_day: "",
      dob_month: "",
      dob_year: "",
      accept_terms: "",
      authorised_officer: ""
    }
  end

  def directors_params
    {
      name: "Test Name",
      email: "valid@email.com"
    }
  end
end
