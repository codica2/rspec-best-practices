require 'rails_helper'

RSpec.feature 'Loan and Insursnce', type: :feature do
  describe 'user send loan' do
    let!(:city) { create :city } # use factory_bot for population test DB

    scenario 'correct value' do
      fill_in('loan-name', with: Faker::Name.name)
      fill_in('loan-email', with: Faker::Internet.email)
      chosen_select(I18n.t('loan.second_hand'), from: '#loan_car_type')
      chosen_select(city.name, from: '#loan_city')
      fill_in('loan-amount_of_money', with: Faker::Number.number(4))
      fill_in('loan-monthly_income', with: Faker::Number.number(4))
      click_button(I18n.t('loan.send'))

      expect(page).to have_content(I18n.t('loan.success'))
    end
  end

end
