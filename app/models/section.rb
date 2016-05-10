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

class Section < ActiveRecord::Base
  # belongs_to :benefit
  has_and_belongs_to_many :benefits
  default_scope { order('position ASC') }

  def strip_html_from_content
    content = self.content
    newcontent = content.gsub('<h4>', '').gsub('</h4>', '').gsub('<b>', '').gsub('</b>', '').gsub('<h5>','<p>').gsub('</h5>', '</p>').gsub('&nbsp;', '').gsub('<br>', '').gsub('<p>', '').gsub('</p>', '')
    self.update_attribute('content', newcontent)
  end
end
