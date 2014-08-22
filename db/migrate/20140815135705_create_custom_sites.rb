class CreateCustomSites < ActiveRecord::Migration
  def change
    create_table :custom_sites do |t|
      t.string :name, limit: 60
      t.string :url, limit: 60
      t.string :company_name, limit: 60
      t.string :city, limit: 60
      t.string :state, limit: 30
      t.string :zip_code, limit: 10
      t.string :primary_color, limit: 10
      t.string :secondary_color, limit: 10
      t.string :link_color, limit: 10
      t.string :link_color_hover, limit: 10
      t.string :club_name, limit: 60
      t.string :bank_website, limit: 60

      t.timestamps
    end
  end
end
