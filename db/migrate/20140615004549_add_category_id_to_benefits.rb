class AddCategoryIdToBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :category_id, :integer
  end
end
