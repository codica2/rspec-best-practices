FactoryGirl.define do
  factory :investor do
    name { Faker::Name.name }
    email 'investor@example.com'
    password 'UZGE4nqP5buQ'
  end
end
