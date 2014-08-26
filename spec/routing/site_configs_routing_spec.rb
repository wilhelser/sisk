require "rails_helper"

RSpec.describe SiteConfigsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/site_configs").to route_to("site_configs#index")
    end

    it "routes to #new" do
      expect(:get => "/site_configs/new").to route_to("site_configs#new")
    end

    it "routes to #show" do
      expect(:get => "/site_configs/1").to route_to("site_configs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/site_configs/1/edit").to route_to("site_configs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/site_configs").to route_to("site_configs#create")
    end

    it "routes to #update" do
      expect(:put => "/site_configs/1").to route_to("site_configs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/site_configs/1").to route_to("site_configs#destroy", :id => "1")
    end

  end
end
