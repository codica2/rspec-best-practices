FactoryGirl.define do
  factory :fabrication do
    state { Fabrication::STATES.keys.sample }

    trait :shipped do
      state 'shipped'
    end
  end
end
