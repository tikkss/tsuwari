require 'spec_helper'

describe "health_records/show" do
  before(:each) do
    @health_record = assign(:health_record, stub_model(HealthRecord,
      :time_period => 1,
      :health => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/朝/)
    rendered.should match(/普通/)
  end
end
