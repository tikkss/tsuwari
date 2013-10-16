require 'spec_helper'

describe "health_records/edit" do
  before(:each) do
    @health_record = assign(:health_record, stub_model(HealthRecord,
      :time_period => 1,
      :health => 1
    ))
  end

  it "renders the edit health_record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", health_record_path(@health_record), "post" do
      assert_select "input#health_record_time_period_1[type=radio][name=?]", "health_record[time_period]"
      assert_select "input#health_record_time_period_2[type=radio][name=?]", "health_record[time_period]"
      assert_select "input#health_record_time_period_3[type=radio][name=?]", "health_record[time_period]"
      assert_select "input#health_record_health_1[type=radio][name=?]", "health_record[health]"
      assert_select "input#health_record_health_2[type=radio][name=?]", "health_record[health]"
      assert_select "input#health_record_health_3[type=radio][name=?]", "health_record[health]"
    end
  end
end
