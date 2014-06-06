class AddCustomFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, limit: 60
    add_column :users, :last_name, :string, limit: 60
    add_column :users, :member_id, :integer
    add_column :users, :login_code, :integer
    add_column :users, :email_updates, :boolean, default: false
  end
end
