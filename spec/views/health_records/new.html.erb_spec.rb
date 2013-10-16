require 'spec_helper'

describe "health_records/new" do
  before(:each) do
    assign(:health_record, stub_model(HealthRecord,
      :time_period => 1,
      :health => 1
    ).as_new_record)
  end

  it "renders new health_record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", health_records_path, "post" do
      assert_select "input#health_record_time_period_1[type=radio][name=?]", "health_record[time_period]"
      assert_select "input#health_record_time_period_2[type=radio][name=?]", "health_record[time_period]"
      assert_select "input#health_record_time_period_3[type=radio][name=?]", "health_record[time_period]"
      assert_select "input#health_record_health_1[type=radio][name=?]", "health_record[health]"
      assert_select "input#health_record_health_2[type=radio][name=?]", "health_record[health]"
      assert_select "input#health_record_health_3[type=radio][name=?]", "health_record[health]"
    end
  end
end
