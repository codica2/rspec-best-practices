module ClocksSteps
  step 'I visit investment without clocks for 2016 year' do
    investment = Investment.multi_family.find { |investment| investment.clock_years.where(year: 2016).empty? }
    visit_investment_clocks(investment)
  end

  step 'I visit investment with clocks for 2016 year' do
    investment = Investment.find { |investment| investment.clock_years.where(year: 2016).present? }
    visit_investment_clocks(investment)
  end

  step 'I enter Current Occupancy clock data' do
    all(:xpath, '//tr/td[2]/input[contains(@name, "min")]').each { |input| input.set(1000) }
    all(:xpath, '//tr/td[2]/input[contains(@name, "boundary_1")]').each { |input| input.set(2000) }
    all(:xpath, '//tr/td[2]/input[contains(@name, "boundary_2")]').each { |input| input.set(3000) }
    all(:xpath, '//tr/td[2]/input[contains(@name, "max")]').each { |input| input.set(4000) }
    all(:xpath, '//tr/td[2]/input[contains(@name, "status")]').each { |input| input.set(2500) }
  end

  def visit_investment_clocks(investment)
    send 'I visit :path', Rails.application.routes.url_helpers.admin_investment_clocks_path(investment, year: 2016)
    send 'I should see :content', "Clocks: #{investment.name}"
  end
end

RSpec.configure { |c| c.include ClocksSteps }
