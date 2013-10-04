require 'spec_helper'

describe "health_records/index" do
  before(:each) do
    assign(:health_records, [
      stub_model(HealthRecord,
        :time_period => 1,
        :health => 2
      ),
      stub_model(HealthRecord,
        :time_period => 1,
        :health => 2
      )
    ])
  end

  it "renders a list of health_records" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
