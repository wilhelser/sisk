class Category < ActiveRecord::Base
  has_many :benefits
  has_and_belongs_to_many :sections
end
