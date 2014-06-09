class HomeSection < ActiveRecord::Base
  scope :visible, where(:visible => true)
end
