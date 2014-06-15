class DropBenefitsCategories < ActiveRecord::Migration
  def change
    drop_table :benefits_categories
  end
end
