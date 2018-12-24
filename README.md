# Rspec Samples

![Rspec Samples](https://images.hgmsites.net/med/adac-50mph-crash-test-shows-weaknesses-even-in-top-rated-cars_100207633_m.jpg)

Quality of the final product is one of the main indicators of successful work, that’s why at [Codica](https://www.codica.com) we have a rule: write tests for each PR and keep tests coverage higher than 80%. For Ruby On Rails projects, we use [RSpec](http://rspec.info/) and capybara to test our apps.

---

<!-- MarkdownTOC depth=0 autolink=true bracket=round -->

- [Testing Environment Configuration](#testing-environment-configuration)
- [Spec structuring](#spec-structuring)
- [Request Spec](#request-spec)
- [Model Spec](#model-spec)
- [Feature Spec](#feature-spec)
- [Helper Spec](#helper-spec)
- [Routing Spec](#routing-spec)
- [Work with Factories](#work-with-factories)
- [Test Coverage](#test-coverage)
- [Testing Speed](#testing-speed)
- [Useful Resources](#useful-resources)
- [About Codica](#about-codica) 

<!-- /MarkdownTOC -->

## Testing Environment Configuration
Rails makes it super easy to write your tests. It starts by producing skeleton test code while you are creating your models and controllers.

In the Rails community, it has become a de facto standard to require the default spec_helper (or an equivalent) in each test file. A typical spec/spec_helper.rb file ends up loading the whole Rails environment, requiring numerous helper files, and setting up various configuration options. All of that, en masse, is more than what any particular test file needs.

Certainly, integration and feature tests depend on the entire Rails environment. ActiveRecord model tests depend on the presence and configuration of a database. These are all good use cases for spec_helper.

[Gemfile example](Gemfile)

[rails_helper example](spec/rails_helper.rb)

## Spec structuring
### How to describe your methods
Be clear in method you describing. For instance, use the Ruby documentation convention of . (or ::) when referring to a class method's name and # when referring to an instance method's name.
```ruby
describe '.authenticate' do
describe '#admin?' do
```
### Use context
Contexts are a powerful method to make your tests clear and well organized. In the long term this practice will keep tests easy to read.
```ruby
context 'when logged in' do
  it { is_expected.to respond_with 200 }
end

context 'when logged out' do
  it { is_expected.to respond_with 401 }
end
```
### Keep your description short
A spec description should never be longer than 40 characters. If this happens you should split it using a context.
```ruby
context 'when not valid' do
  it { is_expected.to respond_with 422 }
end
```
## Request Spec

Request specs provide a thin wrapper around Rails' integration tests, and are
designed to drive behavior through the full stack, including routing
(provided by Rails) and without stubbing (that's up to you)

```ruby
RSpec.describe 'Brand', type: :request do
  let!(:brand) { create :brand }

  it 'show all brands' do
    get brands_path
    expect(response).to have_http_status(200)
    expect(response.body).to include(brand.name)
  end

end
```

[Examples](spec/request)

[Documentation](https://relishapp.com/rspec/rspec-rails/docs/request-specs/request-spec)

## Model Spec

A model spec includes all of the behavior and assertions provided, in addition to RSpec's own
behavior and expectations.

```ruby
  describe 'Assosiation' do
    it { should belong_to(:brand) }
    it { should have_many(:vehicle_listings) }
  end
```

[Examples](spec/models)

[Documentation](https://relishapp.com/rspec/rspec-rails/docs/model-specs)

## Feature spec

Feature specs are high-level tests meant to exercise slices of functionality
through an application.


[Capybara](https://github.com/teamcapybara/capybara) helps you write feature specs that interact with your app's UI as a user does with a browser.

```ruby
 scenario 'empty message' do
   page.evaluate_script('enableSendButton();')
   click_button I18n.t('static.contact.send')
   expect(page).to have_content(I18n.t('cant_be_blank'))
 end
```

[Examples](spec/features)

[Documentation](https://relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec)
[Capybara cheatsheet](https://gist.github.com/zhengjia/428105)
## Helper Spec
Helper specs are marked by ```type: :helper``` or if you have set
config.infer_spec_type_from_file_location! by placing them in spec/helpers.

Helper specs expose a helper object, which includes the helper module being
specified, the ApplicationHelper module (if there is one) and all of the
helpers built into Rails. It does not include the other helper modules in
your app.

```ruby
require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "#page_title" do
    it "returns the default title" do
      expect(helper.page_title).to eq("RSpec is your friend")
    end
  end
end
```

[Documentation](https://relishapp.com/rspec/rspec-rails/docs/helper-specs/helper-spec)

## Routing Spec
Routing specs are marked by ```type: :routing``` or if you have set
config.infer_spec_type_from_file_location! by placing them in spec/routing.

Simple apps with nothing but standard RESTful routes won't get much value from
routing specs, but they can provide significant value when used to specify
customized routes, like vanity links, slugs, etc.

```ruby
expect(get: "/articles/2019/01/when-to-use-routing-specs").to route_to(
  controller: "articles",
  month: "2019-01",
  slug: "when-to-use-routing-specs"
)
```
[Documentation](https://relishapp.com/rspec/rspec-rails/docs/routing-specs)

## Work with Factories
For factories creation within Rails projects we use [factory_bot](https://github.com/thoughtbot/factory_bot)


[Factory Bot](https://github.com/thoughtbot/factory_bot) is a fixtures replacement with a straightforward definition syntax, support for multiple build strategies (saved instances, unsaved instances, attribute hashes, and stubbed objects), and support for multiple factories for the same class (user, admin_user, and so on), including factory inheritance.

```ruby
factory :lead do
  user_name Faker::Name.name
  email { Faker::Internet.email }
  message Faker::RickAndMorty.quote
  target { |t| t.association(:vehicle_listing) }
  phone_number_attributes { attributes_for(:phone_number) }
end
```
[Examples](spec/factories)

[Documentation](https://github.com/thoughtbot/factory_bot)

## Test Coverage
In most cases, you'll want overall coverage results for your projects, including all types of tests. SimpleCov automatically takes care of this by caching and merging results when generating reports, so your report actually includes coverage across your test suites and thereby gives you a better picture of blank spots.

### Installation

Add SimpleCov to your Gemfile and bundle install:
```ruby
gem 'simplecov', require: false, group: :test
```
Load and launch SimpleCov at the very top of your test/test_helper.rb (or spec_helper.rb, rails_helper, cucumber env.rb, or whatever your preferred test framework uses):

```ruby
require 'simplecov'
SimpleCov.start

# Previous content of test helper now starts here
```
Note: If SimpleCov starts after your application code is already loaded (via require), it won't be able to track your files and their coverage! The SimpleCov.start must be issued before any of your application code is required!


Run your tests, open up coverage/index.html in your browser and check out what you've missed so far.

Add the following to your .gitignore file to ensure that coverage results are not tracked by Git (optional):

```
echo coverage >> .gitignore
```


## Testing Speed

### Database queries
While your project grows, the speed of test running may increase.
One of the slowest aspects of running many tests is creating records in a database and removing them. There are several approaches to making this more efficient.
- Use let, rather than let! where you do not need to load data before each example.
- One is to use before_all instead of before_each in a test file, which would load the data once rather than creating and removing a record for each test.
- Another is to have a global variables file, which loads an instance of each record before all tests start, eg FactoryBot.create(:user). This also has a downside of tests not including everything they need within them.
- Use FactoryBot’s build_stubbed method, where possible.

 ### Make your tests running parallel
 
Speedup Tests running [parallel](https://github.com/grosser/parallel_tests)
 on multiple CPU cores. ParallelTests splits tests into even groups (by number of lines or runtime) and runs each group in a single process with its own database.

### Installation

Add to Gemfile:
```ruby
gem 'parallel_tests', group: [:development, :test]
```
Add to ```config/database.yml```
```yml
test:
  database: yourproject_test<%= ENV['TEST_ENV_NUMBER'] %>
```
Create additional database(s):
```sh
rake parallel:create
```
Copy development schema (repeat after migrations):
```sh
rake parallel:prepare
```
### Running

```sh
rake parallel:test          # Test::Unit
rake parallel:spec          # RSpec
rake parallel:features      # Cucumber
rake parallel:features-spinach       # Spinach

rake parallel:test[1] --> force 1 CPU --> 86 seconds
rake parallel:test    --> got 2 CPUs? --> 47 seconds
rake parallel:test    --> got 4 CPUs? --> 26 seconds
```
## Useful Resources
### Books
- [Rails Test Prescriptions](https://www.amazon.com/gp/product/1934356646/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1934356646&linkCode=as2&tag=httpbettersco-20)
- [The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends](https://www.amazon.com/gp/product/1934356379/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1934356379&linkCode=as2&tag=httpbettersco-20)
- [Continuous Testing: with Ruby, Rails, and JavaScript](https://www.amazon.com/gp/product/1934356700/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=1934356700&linkCode=as2&tag=httpbettersco-20)

### Resources on the web
- [Better Specs](http://www.betterspecs.org)
- [Everyday Rails Testing ](https://leanpub.com/everydayrailsrspec)
### Documentation
- [Rspec](https://relishapp.com/rspec)
- [Capybara](https://github.com/teamcapybara/capybara)
- [Factory Bot](https://github.com/thoughtbot/factory_bot)
- [Shoulda Matchers](https://www.rubydoc.info/github/thoughtbot/shoulda-matchers/master/frames)

## License
rspec-best-practices is Copyright © 2015-2018 Codica. It is released under the [MIT License](https://opensource.org/licenses/MIT).

## About Codica

[![Codica logo](https://www.codica.com/assets/images/logo/logo.svg)](https://www.codica.com)

We love open source software! See [our other projects](https://github.com/codica2) or [hire us](https://www.codica.com/) to design, develop, and grow your product.
