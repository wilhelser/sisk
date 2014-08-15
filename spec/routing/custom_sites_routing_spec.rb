require "rails_helper"

RSpec.describe CustomSitesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/custom_sites").to route_to("custom_sites#index")
    end

    it "routes to #new" do
      expect(:get => "/custom_sites/new").to route_to("custom_sites#new")
    end

    it "routes to #show" do
      expect(:get => "/custom_sites/1").to route_to("custom_sites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/custom_sites/1/edit").to route_to("custom_sites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/custom_sites").to route_to("custom_sites#create")
    end

    it "routes to #update" do
      expect(:put => "/custom_sites/1").to route_to("custom_sites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/custom_sites/1").to route_to("custom_sites#destroy", :id => "1")
    end

  end
end
