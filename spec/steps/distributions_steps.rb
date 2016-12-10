module DistributionsSteps
  step 'I visit investment without distributions for 2016 year' do
    investment = Investment.multi_family.find { |investment| investment.distribution_years.where(year: 2017).empty? }
    visit_investment_distributions(investment)
  end

  step 'I visit investment with financial snapshot for 2016 year' do
    investment = Investment.find { |investment| investment.financial_snapshots.where(year: 2016).present? }
    visit_investment_distributions(investment)
  end

  step 'I enter Distributions data' do
    all(:xpath, '//td[normalize-space(text()) = "2017"]/..//input').each do |input|
      input.set(10000)
    end
  end

  step 'I should see 2017 selected' do
    expect(find(:xpath, "//option[normalize-space(text()) = '2017']").selected?).to eql true
  end

  step 'I click delete distribution link' do
    find(:xpath, '//td[normalize-space(text()) = "2017"]/..//a[normalize-space(text()) = "Delete"]').click
  end

  def visit_investment_distributions(investment)
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_distribution_history_path(investment)
    send 'I should see :content', "Distributions: #{investment.name}"
  end
end

RSpec.configure { |c| c.include DistributionsSteps }
