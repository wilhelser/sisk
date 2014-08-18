# == Schema Information
#
# Table name: custom_sites
#
#  id                :integer          not null, primary key
#  name              :string(60)
#  url               :string(60)
#  company_name      :string(60)
#  city              :string(60)
#  state             :string(30)
#  zip_code          :string(10)
#  primary_color     :string(10)
#  secondary_color   :string(10)
#  link_color        :string(10)
#  link_color_hover  :string(10)
#  club_name         :string(60)
#  bank_website      :string(60)
#  created_at        :datetime
#  updated_at        :datetime
#  template          :string(20)
#  account_number    :string(60)
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#
class CustomSite < ActiveRecord::Base
  # require 'paperclip'
  # has_attached_file :logo, :styles => { :medium => "171x75#", :thumb => "85x17#" }
end
