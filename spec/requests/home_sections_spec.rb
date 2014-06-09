require 'rails_helper'

RSpec.describe "HomeSections", :type => :request do
  describe "GET /home_sections" do
    it "works! (now write some real specs)" do
      get home_sections_path
      expect(response.status).to be(200)
    end
  end
end
