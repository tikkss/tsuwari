require 'spec_helper'

describe "foods/show" do
  before(:each) do
    @expect_food    = "カレー"
    @expect_tastes  = %w(甘い 辛い 酸っぱい)
    @food = assign(:food, stub_model(Food,
      name: @expect_food,
      tastes: @expect_tastes.map { |name| stub_model(Taste, name: name) }
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/#{@expect_food}/)
    expect(rendered).to match(/#{@expect_tastes.join(", ")}/)
  end
end
