# == Schema Information
#
# Table name: benefits
#
#  id              :integer          not null, primary key
#  title           :string(255)      not null
#  subtitle        :string(255)
#  content         :text             not null
#  link            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  link_one_text   :string(255)
#  link_two        :string(255)
#  link_two_text   :string(255)
#  link_three      :string(255)
#  link_three_text :string(255)
#  category_id     :integer
#  position        :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :benefit do
    title "MyString"
    subtitle "MyString"
    content "MyText"
    link "MyString"
  end
end
