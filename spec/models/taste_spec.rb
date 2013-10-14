require 'spec_helper'

describe Taste do
  describe "validate" do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
    it { should ensure_length_of(:name).is_at_most(255) }
  end
end
