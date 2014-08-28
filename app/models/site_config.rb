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

class SiteConfig < ActiveRecord::Base
end
