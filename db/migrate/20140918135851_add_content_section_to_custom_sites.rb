class AddContentSectionToCustomSites < ActiveRecord::Migration
  def change
    add_column :custom_sites, :content_section, :integer, limit: 2
  end
end
