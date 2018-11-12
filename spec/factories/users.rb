# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  city                   :string
#  picture_url            :string
#  professional           :boolean
#  newsletter             :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  avatar                 :string
#  provider               :string
#  uid                    :string
#  slug                   :string
#  forum_admin            :boolean          default(FALSE)
#  phone                  :string
#

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    password 'password'
    password_confirmation 'password'
    newsletter false

    factory :forum_admin do
      forum_admin true
    end

  end
end
