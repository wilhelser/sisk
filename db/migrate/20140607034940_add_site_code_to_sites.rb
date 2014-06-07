class AddSiteCodeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :site_code, :integer, null: false
  end
end
