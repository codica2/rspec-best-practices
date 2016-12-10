module VisitAllInvestmentsSteps
  step 'I visit all investments and click all links there' do
    all('td a').map(&:text).uniq.each do |link|
      begin
        investment = Investment.find_by(name: link)
        send 'I click :link_name link', link
        if investment.multi_family?
          send 'I click :link_name link', 'Distribution History'
          send 'I click :link_name link', 'Overview'
          send 'I click :link_name link', 'Financial Snapshot'
        end
        send 'I click :link_name link', 'My Documents'
        send 'I click :link_name link', '<< Back to my Investments'
      rescue Capybara::CapybaraError
        # empty
      end
    end
  end
end

RSpec.configure { |c| c.include VisitAllInvestmentsSteps }
