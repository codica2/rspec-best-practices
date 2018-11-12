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

require 'rails_helper'

RSpec.describe Lead, type: :model do
  it { should have_one(:phone_number).dependent(:destroy).inverse_of(:phoneable) }
  it { should belong_to(:target) }
  it { should have_many(:seller_leads).dependent(:destroy) }

  %i[user_name email].each do |field|
    it { should validate_presence_of(field) }
  end

  describe '.create_seller_lead' do
    it 'should create new seller_leads record' do
      lead = create :lead

      expect(lead.seller_leads.count).to eq 1
    end
  end
end
