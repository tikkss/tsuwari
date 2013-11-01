require 'spec_helper'

describe Serving do
  describe '属性' do
    subject { build(:serving) }

    it { should belong_to(:shop) }
    it { should belong_to(:food) }

    it { should validate_presence_of(:food_id) }
    it { should validate_uniqueness_of(:food_id).scoped_to(:shop_id) }
  end
end
