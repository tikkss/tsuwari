require 'spec_helper'

describe Serving do
  describe '属性' do
    subject { FactoryGirl.build(:serving) }

    it { should respond_to(:shop_id) }
    it { should respond_to(:food_id) }
    it { should be_valid }

    it { should belong_to(:shop) }
    it { should belong_to(:food) }
  end
end
