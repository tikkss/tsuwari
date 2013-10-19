require 'spec_helper'

describe Eating do
  describe "validate" do
    it { should validate_presence_of(:amount) }
  end
end
