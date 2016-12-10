module FinancialSnapshotSteps
  step 'I visit investment without financial snapshot for 2016 year' do
    investment = Investment.multi_family.find { |investment| investment.financial_snapshots.where(year: 2016).empty? }
    visit_investment_financial_snapshot(investment)
  end

  step 'I visit investment with financial snapshot for 2016 year' do
    investment = Investment.find { |investment| investment.financial_snapshots.where(year: 2016).present? }
    visit_investment_financial_snapshot(investment)
  end

  step 'I enter Financial Snapshot data' do
    all(:xpath, '//tr/*[self::th or self::td][2]/input').each { |input| input.set(1000) }
    all(:xpath, '//tr/*[self::th or self::td][3]/input').each { |input| input.set(1000) }
  end

  def visit_investment_financial_snapshot(investment)
    send 'I visit :path', Rails.application.routes.url_helpers
                               .admin_investment_financial_snapshot_path(investment, financial_snapshot_year: 2016)
    send 'I should see :content', "Financial Snapshot: #{investment.name}"
  end
end

RSpec.configure { |c| c.include FinancialSnapshotSteps }
