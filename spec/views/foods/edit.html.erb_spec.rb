require 'spec_helper'

describe "foods/edit" do
  before(:each) do
    @food = assign(:food, stub_model(Food,
      :name => "MyString"
    ))
  end

  it "renders the edit food form" do
    @tastes = Taste.all

    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", food_path(@food), "post" do
      assert_select "input#food_name[name=?]", "food[name]"
    end
  end
end
