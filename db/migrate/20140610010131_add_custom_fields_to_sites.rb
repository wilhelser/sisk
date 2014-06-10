class AddCustomFieldsToSites < ActiveRecord::Migration
  def change
    add_column :sites, :city, :string, limit: 50
    add_column :sites, :state, :string, limit: 2
    add_column :sites, :zip_code, :integer, limit: 5
    add_column :sites, :account_number, :integer
    add_column :sites, :logo, :string
    add_column :sites, :primary_color, :string, limit: 7
    add_column :sites, :secondary_color, :string, limit: 7
    add_column :sites, :link_color, :string, limit: 7
    add_column :sites, :link_color_hover, :string, limit: 7
    add_column :sites, :club_name, :string
    add_column :sites, :bank_website, :string
    add_column :sites, :slug, :string
  end
end
