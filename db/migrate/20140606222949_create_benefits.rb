class CreateBenefits < ActiveRecord::Migration
  def change
    create_table :benefits do |t|
      t.string :title, null: false
      t.string :subtitle
      t.text :content, null: false
      t.string :link

      t.timestamps
    end
  end
end
