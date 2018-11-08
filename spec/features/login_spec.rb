require 'rails_helper'

RSpec.feature 'login page', type: :feature do

  let!(:user) { create :user }
  scenario 'User sign in with correct credentials' do
    visit new_user_session_path # use rails path helpers for navigation
    fill_in(I18n.t('users.profile.login_field'), with: user.email) # always use I18n for strings
    fill_in(I18n.t('devise.registrations.edit_form.password'), with: user.password)
    within('#pills-user') do
      click_on I18n.t('devise.sessions.form.sign_in')
    end
    expect(current_path).to eq(dashboard_path(locale: I18n.locale))
  end

  scenario 'User sign in with incorrect credentials' do
    visit new_user_session_path
    fill_in(I18n.t('users.profile.login_field'), with: user.email)
    fill_in(I18n.t('devise.registrations.edit_form.password'), with: Faker::Internet.password)
    within('#pills-user') do
      click_on I18n.t('devise.sessions.form.sign_in')
    end
    expect(current_path).to eq(new_user_session_path(locale: I18n.locale))
  end


end
