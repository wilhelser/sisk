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

require 'rails_helper'

RSpec.describe Benefit, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
