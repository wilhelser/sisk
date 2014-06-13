class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :benefit_id, null: false

      t.timestamps
    end
  end
end
