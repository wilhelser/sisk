# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :site_config do
    identity_iq_protect_link "MyString"
    identity_iq_pro_link "MyString"
    identity_iq_protect_max_link "MyString"
  end
end
