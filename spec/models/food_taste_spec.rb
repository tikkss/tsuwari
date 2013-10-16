require 'spec_helper'

describe FoodTaste do
  describe "validate" do
    it { should belong_to(:food) }
    it { should belong_to(:taste) }
  end
end
