class DropHomeSections < ActiveRecord::Migration
  def change
    drop_table :home_sections
  end
end
