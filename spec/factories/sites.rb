# == Schema Information
#
# Table name: sites
#
#  id               :integer          not null, primary key
#  site_id          :integer
#  name             :string(255)
#  url              :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  site_code        :integer          not null
#  city             :string(50)
#  state            :string(2)
#  zip_code         :integer
#  account_number   :integer
#  logo             :string(255)
#  primary_color    :string(7)
#  secondary_color  :string(7)
#  link_color       :string(7)
#  link_color_hover :string(7)
#  club_name        :string(255)
#  bank_website     :string(255)
#  slug             :string(255)
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site do
    site_id 1
    name "MyString"
    url "MyString"
  end
end
