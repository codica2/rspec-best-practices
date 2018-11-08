# == Schema Information
#
# Table name: leads
#
#  id            :bigint(8)        not null, primary key
#  user_name     :string
#  email         :string
#  message       :string
#  type          :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  target_type   :string
#  target_id     :bigint(8)
#  offered_price :integer
#

FactoryBot.define do

  factory :lead do
    user_name Faker::Name.name
    email { Faker::Internet.email }
    message Faker::RickAndMorty.quote
    target { |t| t.association(:vehicle_listing) }
    phone_number_attributes { attributes_for(:phone_number) }
  end

end
