module DeleteInvestorSteps
  step 'I choose sample investor and click delete' do
    within(all(:xpath, '//tbody/tr').sample) { click_link 'Destroy' }
  end
end

RSpec.configure { |c| c.include DeleteInvestorSteps }
