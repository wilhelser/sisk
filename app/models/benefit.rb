class Benefit < ActiveRecord::Base
  has_and_belongs_to_many :sites
  belongs_to :category
  # has_many :sections
  has_and_belongs_to_many :sections
  default_scope { order('position ASC') }

  def to_s
    self.title
  end

  def parent
    self.category.title
  end
end
