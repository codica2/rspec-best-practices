module EditInvestmentsSteps
  step 'I visit sample development investment' do
    investment = Investment.development.sample
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_path(investment)
    send 'I should see :content', "Investment: #{investment.name}"
  end

  step 'I visit sample multi family investment' do
    investment = Investment.multi_family.sample
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_path(investment)
    send 'I should see :content', "Investment: #{investment.name}"
  end

  step 'I visit sample loan' do
    investment = Investment.loan.sample
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_path(investment)
    send 'I should see :content', "Loan: #{investment.name}"
  end

  step 'I set investment status completed' do
    find(:xpath, '//div[@id="investment_status_chosen"]').click
    find(:xpath, '//div[@class="chosen-drop"]//*[normalize-space(text()) = "completed"]').click
  end
end

RSpec.configure { |c| c.include EditInvestmentsSteps }
