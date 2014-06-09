require "rails_helper"

RSpec.describe HomeSectionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/home_sections").to route_to("home_sections#index")
    end

    it "routes to #new" do
      expect(:get => "/home_sections/new").to route_to("home_sections#new")
    end

    it "routes to #show" do
      expect(:get => "/home_sections/1").to route_to("home_sections#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/home_sections/1/edit").to route_to("home_sections#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/home_sections").to route_to("home_sections#create")
    end

    it "routes to #update" do
      expect(:put => "/home_sections/1").to route_to("home_sections#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/home_sections/1").to route_to("home_sections#destroy", :id => "1")
    end

  end
end
