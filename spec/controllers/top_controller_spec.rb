require 'spec_helper'

describe TopController do

  describe "GET show" do
    before do
      Shop.stub(:recent_shops).and_return("shops")
      get :show
    end
    it "Shop#recent_shopsの結果を @shopsに格納していること" do
      assigns(:shops).should eq("shops")
    end
  end

end
