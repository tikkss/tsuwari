require "spec_helper"

describe ShopsController do
  describe "routing" do

    it "routes to #index" do
      get("/shops").should route_to("shops#index")
    end

    it "routes to #new" do
      get("/shops/new").should route_to("shops#new")
    end

    it "routes to #show" do
      get("/shops/1").should route_to("shops#show", :id => "1")
    end

    it "routes to #edit" do
      get("/shops/1/edit").should route_to("shops#edit", :id => "1")
    end

    it "routes to #create" do
      post("/shops").should route_to("shops#create")
    end

    it "routes to #update" do
      put("/shops/1").should route_to("shops#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/shops/1").should route_to("shops#destroy", :id => "1")
    end

  end
end
