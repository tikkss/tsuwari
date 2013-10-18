require 'spec_helper'

describe "foods/index" do
  before do
    @food1 = create(:food, tastes: create_list(:taste, 3))
    @food2 = create(:food, tastes: create_list(:taste, 3))
    assign(:search_food, build(:food))
    assign(:tastes, Taste.all)
    assign(:foods, [@food1, @food2])
  end

  it "renders a list of foods" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", text: @food1.name, count: 1
    assert_select "tr>td", text: @food2.name, count: 1
    assert_select "tr>td", text: @food1.tastes.pluck(:name).join(", "), count: 1
    assert_select "tr>td", text: @food2.tastes.pluck(:name).join(", "), count: 1
  end
end
