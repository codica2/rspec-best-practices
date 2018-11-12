require 'rails_helper'

RSpec.describe 'Subscription', type: :request do

  let!(:subscription) { create :subscription }


  it 'confirm_subscription' do
    get confirm_subscription_path(subscription.token)
    expect(response).to have_http_status(302)
    expect(flash[:notice]).to be_present
  end

  it 'unsubscribe' do
    get unsubscribe_subscription(subscription.token)
    expect(response).to have_http_status(302)
    expect(flash[:notice]).to be_present
  end

end
