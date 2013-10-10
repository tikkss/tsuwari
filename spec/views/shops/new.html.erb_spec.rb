require 'spec_helper'

describe "shops/new" do
  before(:each) do
    assign(:shop, stub_model(Shop,
      :name => "MyString",
      :prefecture => "MyString",
      :city => "MyString",
      :address => "MyString",
      :url => "MyString",
      :category_id => 1
    ).as_new_record)
  end

  it "renders new shop form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", shops_path, "post" do
      assert_select "input#shop_name[name=?]", "shop[name]"
      assert_select "input#shop_prefecture[name=?]", "shop[prefecture]"
      assert_select "input#shop_city[name=?]", "shop[city]"
      assert_select "input#shop_address[name=?]", "shop[address]"
      assert_select "input#shop_url[name=?]", "shop[url]"
      assert_select "select#shop_category_id[name=?]", "shop[category_id]"
    end
  end
end
