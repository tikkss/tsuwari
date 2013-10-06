require 'spec_helper'

describe "foods/show" do
  before(:each) do
    @expect_food  = "カレー"
    @expect_taste = %w(甘い 辛い 酸っぱい)
    @food = assign(:food, stub_model(Food,
      name: @expect_food,
      food_tastes: @expect_taste.map do |taste_name|
        stub_model(FoodTaste, taste: stub_model(Taste, name: taste_name))
      end
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/#{@expect_food}/)
    expect(rendered).to match(/#{@expect_taste.join(", ")}/)
  end
end
