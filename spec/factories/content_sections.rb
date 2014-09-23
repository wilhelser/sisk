# == Schema Information
#
# Table name: content_sections
#
#  id                :integer          not null, primary key
#  intro_content     :text
#  health_content    :text
#  insurance_content :text
#  savings_content   :text
#  security_content  :text
#  created_at        :datetime
#  updated_at        :datetime
#  header_text       :text
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :content_section do
    intro_content "MyText"
    health_content "MyText"
    insurance_content "MyText"
    savings_content "MyText"
    security_content "MyText"
  end
end
