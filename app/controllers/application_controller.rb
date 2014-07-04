class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_uuid
  before_filter :set_user_session
  before_filter :after_token_authentication

  def after_token_authentication
    if params[:authentication_key].present?
      @user = User.find_by_authentication_token(params[:authentication_key])
      the user with the authentication_key with which devise has authenticated the user
      sign_in @user if @user
      redirect_to root_path
    end
  end

  def set_uuid
    if user_signed_in?
      current_user.uuid
    end
  end

  def set_user_session
    if devise_controller?
      if user_signed_in?
        @site = current_user.site
      end
    end
  end

  def after_sign_in_path_for(resource)
    if resource.instance_of?(User)
      resource.site
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource.instance_of?(User)
      resource.site
    else
      super
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :member_id, :login_code, :email_updates) }
  end
end
