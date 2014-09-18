# == Schema Information
#
# Table name: content_sections
#
#  id                :integer          not null, primary key
#  intro_content     :text
#  health_content    :text
#  insurance_content :text
#  savings_content   :text
#  security_content  :text
#  created_at        :datetime
#  updated_at        :datetime
#

require 'rails_helper'

RSpec.describe ContentSection, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
