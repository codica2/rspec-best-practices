module NavigationSteps
  step 'I visit :path' do |path|
    visit(path)
  end

  step 'I click :button_name button' do |button_name|
    click_button(button_name)
  end

  step 'I click :link_name link' do |link_name|
    click_link(link_name)
  end

  step 'I click on :selector selector' do |selector|
    find(selector).click
  end

  step 'I click on :content' do |content|
    find(:xpath, "//*[normalize-space(text()) = '#{content}']").click
  end

  step 'I trigger :event on :content' do |event, content|
    find(:xpath, "//*[normalize-space(text()) = '#{content}']").trigger(event)
  end

  step 'I click submit input' do
    find(:xpath, '//input[@type = "submit"]').click
  end

  step 'I wait :seconds seconds' do |seconds|
    sleep seconds.to_f
  end

  step 'I take screenshot' do
    sleep(0.5)
    puts(page.save_screenshot(Rails.root.join('tmp', 'capybara', "#{SecureRandom.hex}.png").to_s, full: true))
  end
end

RSpec.configure { |c| c.include NavigationSteps }
