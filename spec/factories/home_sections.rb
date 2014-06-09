# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :home_section do
    title "MyString"
    content "MyText"
    link "MyString"
    visible false
  end
end
