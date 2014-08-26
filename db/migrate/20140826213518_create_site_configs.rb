class CreateSiteConfigs < ActiveRecord::Migration
  def change
    create_table :site_configs do |t|
      t.string :identity_iq_protect_link, limit: 180
      t.string :identity_iq_pro_link, limit: 180
      t.string :identity_iq_protect_max_link, limit: 180

      t.timestamps
    end
  end
end
