class CreateBenefitsSections < ActiveRecord::Migration
  def change
    create_table :benefits_sections, id: false do |t|
      t.references :benefit
      t.references :section
    end
    add_index :benefits_sections, [:section_id, :benefit_id]
    add_index :benefits_sections, [:benefit_id, :section_id]
  end
end
