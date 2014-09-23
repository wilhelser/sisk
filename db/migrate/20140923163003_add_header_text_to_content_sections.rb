class AddHeaderTextToContentSections < ActiveRecord::Migration
  def change
    add_column :content_sections, :header_text, :text
  end
end
