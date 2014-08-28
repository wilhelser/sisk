# == Schema Information
#
# Table name: site_configs
#
#  id                           :integer          not null, primary key
#  identity_iq_protect_link     :string(180)
#  identity_iq_pro_link         :string(180)
#  identity_iq_protect_max_link :string(180)
#  created_at                   :datetime
#  updated_at                   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_config do
    identity_iq_protect_link "MyString"
    identity_iq_pro_link "MyString"
    identity_iq_protect_max_link "MyString"
  end
end
