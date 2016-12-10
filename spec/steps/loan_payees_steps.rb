module LoanPayeesSteps
  step 'I visit loan with some payees' do
    investment = Investment.loan.includes(:lenders).select { |investment| investment.lenders.present? }.sample
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_path(investment)
    send 'I should see :content', "Loan: #{investment.name}"
  end

  step 'I select loan distribution' do
    find(:xpath, '//div[@id="loan_data_distribution_chosen"]').click
    all(:xpath, '//div[@id="loan_data_distribution_chosen"]//ul/li').sample.click
  end

  step 'I edit first payee' do
    find(:xpath, '//tbody/tr[1]/td[3]/input').set(10000)
    find(:xpath, '//tbody/tr[1]/td[2]/input').set('2016-12-1')
    find(:xpath, '//tbody/tr[1]/td[7]/input').set('2016-12-7')
  end

  step 'I delete sample lender from loan' do
    all(:xpath, '//a[normalize-space(text()) = "Delete"]').sample.click
  end
end

RSpec.configure { |c| c.include LoanPayeesSteps }
