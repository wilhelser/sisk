class AddPositionToBenefits < ActiveRecord::Migration
  def change
    add_column :benefits, :position, :integer
  end
end
