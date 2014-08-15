require 'rails_helper'

RSpec.describe "CustomSites", :type => :request do
  describe "GET /custom_sites" do
    it "works! (now write some real specs)" do
      get custom_sites_path
      expect(response.status).to be(200)
    end
  end
end
