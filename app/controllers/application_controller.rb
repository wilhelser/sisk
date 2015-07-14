class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # acts_as_token_authentication_handler_for User
  protect_from_forgery with: :null_session
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_uuid
  before_filter :set_user_session
  # before_filter :check_for_custom_site
  # before_filter :after_token_authentication

  def after_token_authentication
    if params[:authentication_key].present?
      @user = User.find_by_authentication_token(params[:authentication_key])
      sign_in @user if @user
      render json: @user, status: 200
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
      if resource.custom_site_id.present?
        @custom_site = CustomSite.find(resource.custom_site_id)
        custom_site_home_path(@custom_site.url)
      else
        # about_path
        resource.site
      end
    else
      super
    end
  end

  def after_sign_up_path_for(resource)
    if resource.instance_of?(User)
      if resource.custom_site_id.present?
        @custom_site = CustomSite.find(resource.custom_site_id)
        custom_site_home_path(@custom_site.url)
      else
        resource.site
      end
    else
      super
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def get_custom_site_slugs
    CustomSite.all.pluck(:url)
  end

  def is_active?(link_path)
   current_page?(link_path) ? "active" : ""
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :first_name, :last_name, :member_id, :login_code, :email_updates) }
  end
end
