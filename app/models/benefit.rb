class Benefit < ActiveRecord::Base
  has_and_belongs_to_many :sites
  belongs_to :category
  # has_many :sections
  has_and_belongs_to_many :sections
  scope :health, -> { where(:category_id == 2) }
  scope :insurance, -> { where(:category_id == 3) }
  scope :security, -> { where(:category_id == 4) }

  def to_s
    self.title
  end
end
