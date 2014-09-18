class CreateContentSections < ActiveRecord::Migration
  def change
    create_table :content_sections do |t|
      t.text :intro_content
      t.text :health_content
      t.text :insurance_content
      t.text :savings_content
      t.text :security_content

      t.timestamps
    end
  end
end
