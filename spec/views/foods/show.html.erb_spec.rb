require 'spec_helper'

describe "foods/show" do
  before do
    @food = create(:food, :with_tastes)
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    expect(rendered).to match(/#{@food.name}/)
    expect(rendered).to match(/#{@food.tastes.pluck(:name).join(", ")}/)
  end
end
