class HomeSection < ActiveRecord::Base
  has_and_belongs_to_many :sites
  scope :visible, -> { where(visible: true) }
end
