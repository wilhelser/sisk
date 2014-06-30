# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(50)       not null
#  created_at :datetime
#  updated_at :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :category do
    title "MyString"
  end
end
