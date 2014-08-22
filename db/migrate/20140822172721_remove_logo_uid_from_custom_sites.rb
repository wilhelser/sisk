class RemoveLogoUidFromCustomSites < ActiveRecord::Migration
  def change
    remove_column :custom_sites, :logo_uid
  end
end
