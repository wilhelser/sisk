class HomeController < ApplicationController
  layout 'sites', only: [:about]

  def index
    if params[:site_code]
      @site_code = params[:site_code]
      send_to_site(@site_code)
    end
  end

  def about
    @page_title = "About Us"
  end

  def usage
    @page_title = "Member Benefit Usage Instructions"
  end

  private

  def send_to_site(site_code)
    @site = Site.find_by_site_code(site_code)
    if @site
      redirect_to @site
    else
      render action: 'index', notice: "Invalid Site code"
    end
  end
end
