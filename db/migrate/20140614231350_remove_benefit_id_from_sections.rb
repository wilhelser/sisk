class RemoveBenefitIdFromSections < ActiveRecord::Migration
  def change
    remove_column :sections, :benefit_id
  end
end
