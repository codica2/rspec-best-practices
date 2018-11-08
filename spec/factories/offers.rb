# == Schema Information
#
# Table name: offers
#
#  id          :bigint(8)        not null, primary key
#  target_type :string
#  target_id   :bigint(8)
#  message     :text
#  with_sms    :boolean          default(FALSE)
#  finished    :boolean          default(FALSE)
#  paid        :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryBot.define do
  factory :offer do
    target { |t| t.association(:vehicle_listing) }
    message Faker::RickAndMorty.quote
    finished true
    factory :unfinished_offer do
      finished false
    end
  end
end
