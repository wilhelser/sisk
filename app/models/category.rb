# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  title      :string(50)       not null
#  created_at :datetime
#  updated_at :datetime
#

class Category < ActiveRecord::Base
  has_many :benefits
  has_and_belongs_to_many :sections
end
