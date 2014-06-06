class CreateBenefitsSitesTable < ActiveRecord::Migration
  def change
    create_table :benefits_sites, id: false do |t|
      t.references :benefit
      t.references :site
    end
    add_index :benefits_sites, [:site_id, :benefit_id]
    add_index :benefits_sites, [:benefit_id, :site_id]
  end
end
