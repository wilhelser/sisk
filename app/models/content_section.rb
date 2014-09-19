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

class ContentSection < ActiveRecord::Base
  has_many :custom_sites
  def to_s
    self.id.to_s
  end
end
