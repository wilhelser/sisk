# == Schema Information
#
# Table name: sections
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  content    :text             not null
#  created_at :datetime
#  updated_at :datetime
#  position   :integer
#

require 'rails_helper'

RSpec.describe Section, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
