class ChangeUsersMemberIdToString < ActiveRecord::Migration
  def change
    change_column :users, :member_id, :string, limit: 9
  end
end
