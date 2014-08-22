class CustomSitesController < ApplicationController
  layout 'custom_site'
  before_action :set_custom_site

  def index
    @body_class = 'login'
    if user_signed_in?
      redirect_to current_user.site
    end
  end

  def custom_site_params
    params.require(:site).permit(:name, :url, :company_name, :city, :state, :zip_code, :primary_color, :secondary_color, :link_color, :link_color_hover, :club_name, :bank_website, :template, :account_number, :logo)
  end

  private
  def set_custom_site
    if params[:site_slug]
      @custom_site = CustomSite.find_by_url(params[:site_slug])
      session[:custom_site] = @custom_site.id
      @primary_color = @custom_site.primary_color
      @secondary_color = @custom_site.secondary_color
      @link_color = @custom_site.link_color
      @link_hover_color = @custom_site.link_color_hover
      @template = @custom_site.template
      @logo = @custom_site.logo.url
    end
  end
end
