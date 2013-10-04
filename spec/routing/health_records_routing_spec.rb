require "spec_helper"

describe HealthRecordsController do
  describe "routing" do

    it "routes to #index" do
      get("/health_records").should route_to("health_records#index")
    end

    it "routes to #new" do
      get("/health_records/new").should route_to("health_records#new")
    end

    it "routes to #show" do
      get("/health_records/1").should route_to("health_records#show", :id => "1")
    end

    it "routes to #edit" do
      get("/health_records/1/edit").should route_to("health_records#edit", :id => "1")
    end

    it "routes to #create" do
      post("/health_records").should route_to("health_records#create")
    end

    it "routes to #update" do
      put("/health_records/1").should route_to("health_records#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/health_records/1").should route_to("health_records#destroy", :id => "1")
    end

  end
end
