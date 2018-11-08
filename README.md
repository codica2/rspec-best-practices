# Rspec Samples

![Rspec Samples](https://images.hgmsites.net/med/adac-50mph-crash-test-shows-weaknesses-even-in-top-rated-cars_100207633_m.jpg)

Quality of the end product is one of the main indicators of successful work, 
that’s why at [![Codica logo](https://www.codica.com/assets/images/logo/logo.svg)](https://www.codica.com) we have a rule: write tests for each PR and keep tests coverage higher than 80%. For Ruby On Rails projects, we use rspec and capybara to test our apps.

There are several main testing methods:

   - **Model** specs - used for testing models and other classes;
   - **Request** specs - used for testing controller actions with a server running; especially useful for API coverage;
   - **Feature** specs - these specs represent user's interaction with the website.

## Testing Environment Configuration
[Gemfile example](Gemfile)

[rails_helper example](spec/rails_helper.rb)

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
A model spec includes all of the behavior and assertions that it provides, in addition to RSpec's own
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

```ruby
 scenario 'empty message' do
   page.evaluate_script('enableSendButton();')
   click_button I18n.t('static.contact.send')
   expect(page).to have_content(I18n.t('cant_be_blank'))
 end
```
[Examples](spec/features)

[Documentation](https://relishapp.com/rspec/rspec-rails/docs/feature-specs/feature-spec)

## Factories defination

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