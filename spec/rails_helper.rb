require 'simplecov'
SimpleCov.start
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'
require 'rspec/retry'
require 'selenium/webdriver'
require 'capybara-screenshot/rspec'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
ActiveRecord::Migration.maintain_test_schema!

Capybara::Screenshot.register_driver(:headless_chrome) do |driver, path|
  driver.browser.save_screenshot("tmp/capybara/chrom_#{Time.now}.png")
end
Capybara.default_driver = :headless_chrome
Capybara.register_driver :headless_chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
      chromeOptions: { args: %w(headless disable-gpu no-sandbox --window-size=1600,1600) }
  )
  Capybara::Selenium::Driver.new app,
                                 browser: :chrome,
                                 desired_capabilities: capabilities
end

Capybara.exact = true
Chromedriver.set_version '2.36'
Capybara.javascript_driver = :headless_chrome

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include RequestSpecHelper
  config.include Chosen::Rspec::FeatureHelpers, type: :feature
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  # rspec-retry
  config.around(:all, type: :feature) do |ex|
    ex.run_with_retry retry: 2
  end
  config.verbose_retry = true
  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
