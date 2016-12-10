module EditInvestorSteps
  step "I visit sample investor's page" do
    investor = Investor.all.sample
    send 'I visit :path', "/admin/investors/#{investor.id}"
  end
end

RSpec.configure { |c| c.include EditInvestorSteps }
