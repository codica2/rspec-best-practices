require 'ffaker'

FactoryGirl.define do
  factory :contact do
    first_name   { Faker::Name.first_name }
    last_name    { Faker::Name.last_name  }
    email        { Faker::Internet.email  }
    subject      { Faker::HipsterIpsum.words(4).to_sentence }
    site_version { %w(au us nz gb tw cn).sample }
    message      { Faker::HipsterIpsum.words(rand(25..50)).to_sentence }
    phone        { Faker::PhoneNumber.phone_number }
    order_number { Faker.bothify('?#########').upcase }
  end
end
