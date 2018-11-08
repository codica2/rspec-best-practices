# == Schema Information
#
# Table name: coupons
#
#  id         :integer          not null, primary key
#  code       :string           not null
#  percents   :integer          not null
#  used       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Coupon, type: :model do
  it { should validate_presence_of(:percents) }
end
