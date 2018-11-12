# == Schema Information
#
# Table name: models
#
#  id         :integer          not null, primary key
#  brand_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  car_type   :integer
#  position   :integer
#

require 'rails_helper'

RSpec.describe Model, type: :model do
  describe 'Assosiation' do
    it { define_enum_for(:car_type) }
    it { should belong_to(:brand) }
    it { should have_many(:vehicle_listings) }
    it { should validate_presence_of(:name) }
  end
end
