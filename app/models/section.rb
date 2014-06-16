class Section < ActiveRecord::Base
  # belongs_to :benefit
  has_and_belongs_to_many :benefits
  default_scope { order('title ASC') }
end
