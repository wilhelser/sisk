# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string(255)
#  site_id                :integer
#  first_name             :string(60)
#  last_name              :string(60)
#  member_id              :string(10)
#  login_code             :integer
#  email_updates          :boolean          default(FALSE)
#  uuid                   :string(10)
#  ent_registered         :boolean          default(FALSE)
#  authentication_token   :string(255)
#  custom_site_id         :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  end
end
