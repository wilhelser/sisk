class AddCustomSiteIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :custom_site_id, :integer
  end
end
