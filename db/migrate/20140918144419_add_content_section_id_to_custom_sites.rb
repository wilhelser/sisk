class AddContentSectionIdToCustomSites < ActiveRecord::Migration
  def change
    add_column :custom_sites, :content_section_id, :integer
    remove_column :custom_sites, :content_section
  end
end
