class Benefit < ActiveRecord::Base
  has_and_belongs_to_many :sites
  has_and_belongs_to_many :categories
end
