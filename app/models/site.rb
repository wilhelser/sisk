class Site < ActiveRecord::Base
  has_many :users
  has_and_belongs_to_many :benefits
  has_and_belongs_to_many :home_sections
end
