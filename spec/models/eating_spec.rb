require 'spec_helper'

describe Eating do
  describe "validate" do
    it { should belong_to(:health_record) }
    it { should belong_to(:food) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).only_integer }
    it { should ensure_inclusion_of(:amount).
         in_array(Eating::AMOUNTS.map { |h| h[:value] }) }
    it { should validate_presence_of(:health_record_id) }
    it {
      create(:eating)
      should validate_uniqueness_of(:health_record_id).scoped_to(:food_id)
    }
  end
end
