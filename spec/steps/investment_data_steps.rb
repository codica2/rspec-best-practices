module InvestmentDataSteps
  step 'I visit sample investment page and click Investors' do
    investment = Investment.includes(:investors).where(['investment_type IN (?)', [0, 1]])
                           .select { |investment| investment.investors.present? }.sample
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_path(investment)
    send 'I should see :content', "Investment: #{investment.name}"
    find(:xpath, '//div[@class="show_center"]//a[normalize-space(text()) = "Investors"]').click
    send 'I should see :content', "Investors: #{investment.name}"
  end

  step 'I edit invest amount of investor' do
    find(:xpath, '//tbody/tr[1]/td[4]/input').set(10000)
  end

  step 'I delete sample investor from investment' do
    all(:xpath, '//a[normalize-space(text()) = "Delete"]').sample.click
  end
end

RSpec.configure { |c| c.include InvestmentDataSteps }
