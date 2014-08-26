require 'rails_helper'

RSpec.describe "SiteConfigs", :type => :request do
  describe "GET /site_configs" do
    it "works! (now write some real specs)" do
      get site_configs_path
      expect(response.status).to be(200)
    end
  end
end
