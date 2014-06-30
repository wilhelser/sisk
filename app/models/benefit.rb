# == Schema Information
#
# Table name: benefits
#
#  id              :integer          not null, primary key
#  title           :string(255)      not null
#  subtitle        :string(255)
#  content         :text             not null
#  link            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  link_one_text   :string(255)
#  link_two        :string(255)
#  link_two_text   :string(255)
#  link_three      :string(255)
#  link_three_text :string(255)
#  category_id     :integer
#  position        :integer
#

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
