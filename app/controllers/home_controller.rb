class HomeController < ApplicationController
  # if params[:site_slug].present?
  #   layout 'custom_site'
  # end

  def index
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

end
