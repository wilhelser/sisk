# == Schema Information
#
# Table name: site_configs
#
#  id                           :integer          not null, primary key
#  identity_iq_protect_link     :string(180)
#  identity_iq_pro_link         :string(180)
#  identity_iq_protect_max_link :string(180)
#  created_at                   :datetime
#  updated_at                   :datetime
#

require 'rails_helper'

RSpec.describe SiteConfig, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
