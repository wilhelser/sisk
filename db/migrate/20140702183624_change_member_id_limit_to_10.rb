class ChangeMemberIdLimitTo10 < ActiveRecord::Migration
  def change
    change_column :users, :member_id, :string, limit: 10
  end
end
