require 'spec_helper'

describe "shops/show" do
  before(:each) do
    @shop = assign(:shop, stub_model(Shop,
      :name => "Name",
      :prefecture => "Prefecture",
      :city => "City",
      :address => "Address",
      :url => "Url",
      :category_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Prefecture/)
    rendered.should match(/City/)
    rendered.should match(/Address/)
    rendered.should match(/Url/)
    rendered.should match(/1/)
  end
end
