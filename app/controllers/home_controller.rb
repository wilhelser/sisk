class HomeController < ApplicationController
  # layout 'custom_site' unless params[:custom_site].blank?
  # before_action :check_for_custom_site
  # before_action :setup_custom_site

  def index
    layout 'custom_site' unless setup_custom_site.blank?
    @body_class = 'home'
    if user_signed_in?
      redirect_to current_user.site
    end
  end

  def about
    @page_title = "About Us"
  end

  def usage
    @page_title = "Member Benefit Usage Instructions"
  end

  def setup_custom_site
    @custom_site = session[:custom_site]
  end



end
