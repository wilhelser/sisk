class AddLogoToCustomSites < ActiveRecord::Migration
  def change
    add_column :custom_sites, :logo, :string
  end
end
