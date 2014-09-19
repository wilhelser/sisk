class HomeController < ApplicationController

  def index
    @body_class = 'home'
    if user_signed_in?
      redirect_to current_user.site
    end
  end

  def about
    @page_title = "About Us"
  end

  def privacy
    @page_title = "Privacy Policy"
  end

  def usage
    @page_title = "Member Benefit Usage Instructions"
  end

end
