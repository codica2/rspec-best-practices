require 'rails_helper'

RSpec.describe 'Brand', type: :request do
  image = open(File.join(Rails.root, "/spec/files/test.jpg"))
  let!(:brand) { create :brand, icon: image }
  let!(:ad)  { create :vehicle_listing, brand: brand }

  it 'show all brands' do
    get brands_path
    expect(response).to have_http_status(200)
    expect(response.body).to include(brand.name)
  end

  it 'show brand by id' do
    get brand_path(brand: brand.name, car_type: brand.car_type, country: I18n.t('common.country'))
    expect(response).to have_http_status(200)
    expect(response.body).to include(ad.model.name)
  end

end
