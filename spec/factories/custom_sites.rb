# == Schema Information
#
# Table name: custom_sites
#
#  id                 :integer          not null, primary key
#  name               :string(60)
#  url                :string(60)
#  company_name       :string(60)
#  city               :string(60)
#  state              :string(30)
#  zip_code           :string(10)
#  primary_color      :string(10)
#  secondary_color    :string(10)
#  link_color         :string(10)
#  link_color_hover   :string(10)
#  club_name          :string(60)
#  bank_website       :string(60)
#  created_at         :datetime
#  updated_at         :datetime
#  template           :string(20)
#  account_number     :string(60)
#  logo               :string(255)
#  login_code         :integer
#  content_section_id :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :custom_site do
    name "MyString"
    url "MyString"
    company_name "MyString"
    city "MyString"
    state "MyString"
    zip_code "MyString"
    primary_color "MyString"
    secondary_color "MyString"
    link_color "MyString"
    link_color_hover "MyString"
    club_name "MyString"
    bank_website "MyString"
  end
end
