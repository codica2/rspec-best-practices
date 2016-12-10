module ProgressesSteps
  step 'I visit sample development investment with some progresses' do
    investment = Investment.development.includes(:progresses)
                           .select { |investment| investment.progresses.present? }.sample
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_path(investment)
    send 'I should see :content', "Investment: #{investment.name}"
  end

  step 'I edit first progress' do
    find(:xpath, '//tbody/tr[1]//option[normalize-space(text()) = "excellent"]').select_option
    find(:xpath, '//tbody/tr[1]/td[2]/input').set('Some description')
  end

  step 'I delete sample progress from investment' do
    all(:xpath, '//a[normalize-space(text()) = "Delete"]').sample.click
  end
end

RSpec.configure { |c| c.include ProgressesSteps }
