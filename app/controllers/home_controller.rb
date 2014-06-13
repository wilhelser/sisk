class HomeController < ApplicationController
  layout 'sites', only: [:about]

  def index
    @body_class = 'home'
  end

  def about
    @page_title = "About Us"
  end

  def usage
    @page_title = "Member Benefit Usage Instructions"
  end

end
