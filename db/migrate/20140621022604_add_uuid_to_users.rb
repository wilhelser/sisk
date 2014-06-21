class AddUuidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uuid, :string, limit: 10
  end
end
