class AddLogoUidToCustomSites < ActiveRecord::Migration
  def change
    add_column :custom_sites, :logo_uid, :string, limit: 80
  end
end
