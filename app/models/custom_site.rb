# == Schema Information
#
# Table name: custom_sites
#
#  id               :integer          not null, primary key
#  name             :string(60)
#  url              :string(60)
#  company_name     :string(60)
#  city             :string(60)
#  state            :string(30)
#  zip_code         :string(10)
#  primary_color    :string(10)
#  secondary_color  :string(10)
#  link_color       :string(10)
#  link_color_hover :string(10)
#  club_name        :string(60)
#  bank_website     :string(60)
#  created_at       :datetime
#  updated_at       :datetime
#  template         :string(20)
#  logo             :string(255)
#  account_number   :string(60)
#
class CustomSite < ActiveRecord::Base
  after_create :write_redirect_to_routes

  def write_redirect_to_routes
    # insert_into_file "config/routes.rb", "\n  get \"#{self.url}\", :to => 'home#index'", :before => /^end/
    open('config/routes.rb', 'a') do |f|
      f << "\n  get \"#{self.url}\""
    end
    # new_route = "\n  get \"#{self.url}\", :to => 'home#index'"
    # route new_route
  end
end
