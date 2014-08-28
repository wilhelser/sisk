class AddLoginCodeToCustomSites < ActiveRecord::Migration
  def change
    add_column :custom_sites, :login_code, :integer
  end
end
