class Section < ActiveRecord::Base
  # belongs_to :benefit
  has_and_belongs_to_many :benefits, class_name: "BenefitsSections"
  default_scope { order('title ASC') }
end
