class CreateHomeSectionsSites < ActiveRecord::Migration
  def change
    create_table :home_sections_sites, id: false do |t|
      t.references :home_section
      t.references :site
    end
    add_index :home_sections_sites, [:site_id, :home_section_id]
    add_index :home_sections_sites, [:home_section_id, :site_id]
  end
end
