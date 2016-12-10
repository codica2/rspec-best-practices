module AdminDistributionSteps
  step 'I click through all distribution years' do
    while previous_year_link.present?
      previous_year_link.click
      send 'I wait :seconds seconds', 1
      send 'I should see :content', 'Distributions'
    end
  end

  def previous_year_link
    find('#previous_year')
  rescue Capybara::ElementNotFound
    nil
  end
end

RSpec.configure { |c| c.include AdminDistributionSteps }
