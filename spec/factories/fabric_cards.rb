FactoryGirl.define do
  factory :fabric_card do
    name          { Faker::Name.first_name }
    sku_component { rand(99).to_s }
  end
end
