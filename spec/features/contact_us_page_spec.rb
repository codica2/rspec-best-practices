require 'rails_helper'

RSpec.feature 'Contact us page', type: :feature do
  describe 'User send contact request' do
    before(:each) { visit contact_path }

    # check Negative test case
    scenario 'empty message' do
      page.evaluate_script('enableSendButton();')
      click_button I18n.t('static.contact.send')
      expect(page).to have_content(I18n.t('cant_be_blank'))
    end

    # check Positive test case
    scenario 'correct data' do
      fill_in('contact-name', with: Faker::Name.name) # use Faker gem for filling forms
      fill_in('contact-email', with: Faker::Internet.email)
      fill_in('listing-description', with: Faker::Lorem.sentence)
      page.evaluate_script('enableSendButton();')
      click_button I18n.t('static.contact.send')
      expect(page).to have_content I18n.t('common.message_sent')
    end
  end
end
