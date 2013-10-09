require 'spec_helper'

describe "foods/index" do
  before(:each) do
    @expect_tastes1 = %w(甘い あっさり)
    @expect_tastes2 = %w(辛い 苦い こってり)

    assign(:foods, [
      stub_model(Food,
        name: "Name",
        tastes: @expect_tastes1.map { |name| stub_model(Taste, name: name) }
      ),
      stub_model(Food,
        name: "Name",
        tastes: @expect_tastes2.map { |name| stub_model(Taste, name: name) }
      )
    ])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: @expect_tastes1.join(", "), count: 1
    assert_select "tr>td", text: @expect_tastes2.join(", "), count: 1
  end
end
