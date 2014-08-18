class RemoveLogoFromCustomSites < ActiveRecord::Migration
  def change
    remove_column :custom_sites, :logo
  end
end
