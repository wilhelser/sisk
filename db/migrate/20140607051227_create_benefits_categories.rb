class CreateBenefitsCategories < ActiveRecord::Migration
  def change
    create_table :benefits_categories, id: false do |t|
      t.references :benefit
      t.references :category
    end
    add_index :benefits_categories, [:category_id, :benefit_id]
    add_index :benefits_categories, [:benefit_id, :category_id]
  end
end
