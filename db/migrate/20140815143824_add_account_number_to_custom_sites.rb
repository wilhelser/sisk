class AddAccountNumberToCustomSites < ActiveRecord::Migration
  def change
    add_column :custom_sites, :account_number, :string, limit: 60
  end
end
