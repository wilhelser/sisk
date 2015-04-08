ActiveAdmin.register User do
  permit_params :first_name, :last_name, :email, :password, :password_confirmation, :current_password, :member_id, :email_updates, :site_id

  filter :email
  filter :first_name
  filter :last_name
  filter :member_id
  filter :login_code
  filter :site_id
  filter :uuid

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
      f.input :email
      f.input :password, required: false
      f.input :password_confirmation
      f.input :email_updates
      f.input :site_id, as: :select, collection: Site.all
    end
    f.actions
  end

  controller do

    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end

  end

  #csv
  csv do
      column :id
      column :first_name
      column :last_name
      column :email
      column :member_id
      column :site_id
      column :uuid
      column :login_code
      column :created_at, label: "Date Registered"
  end
end
