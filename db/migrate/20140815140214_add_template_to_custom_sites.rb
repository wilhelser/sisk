class AddTemplateToCustomSites < ActiveRecord::Migration
  def change
    add_column :custom_sites, :template, :string, limit: 20
  end
end
