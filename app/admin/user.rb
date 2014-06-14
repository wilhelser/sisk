ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :current_password, :first_name, :last_name, :email_updates, :site_id

  # Index
  index do
    selectable_column
    column :id
    column :first_name
    column :last_name
    column :site_id
    column :email_updates
    actions
  end

  # Form
  form do |f|
    f.inputs "User Details" do
      f.input :first_name
      f.input :last_name
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :first_name
      f.input :last_name
      f.input :email_updates
      f.input :site_id, as: :select, collection: Site.all
    end
    f.actions
  end

end
