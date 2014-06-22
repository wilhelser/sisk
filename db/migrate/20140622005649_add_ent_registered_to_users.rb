class AddEntRegisteredToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ent_registered, :boolean, default: false
  end
end
