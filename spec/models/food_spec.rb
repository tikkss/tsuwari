require 'spec_helper'

describe Food do
  describe "validate" do
    it { should have_many(:food_tastes).dependent(:destroy) }
    it { should have_many(:tastes).through(:food_tastes) }
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_most(255) }
  end
end
