class CreateHomeSections < ActiveRecord::Migration
  def change
    create_table :home_sections do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.string :link, null: false
      t.boolean :visible, default: true

      t.timestamps
    end
  end
end
