class AddNewLogoToCustomSites < ActiveRecord::Migration
  def change
    add_attachment :custom_sites, :logo
  end
end
