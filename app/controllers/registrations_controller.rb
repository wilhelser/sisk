class RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json
  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :member_id, :email_updates, :login_code, :custom_site_id)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :current_password, :first_name, :last_name, :email_updates, :password, :password_confirmation)
  end

  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end
end
