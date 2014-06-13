# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :section do
    title "MyString"
    content "MyText"
    benefit_id 1
  end
end
