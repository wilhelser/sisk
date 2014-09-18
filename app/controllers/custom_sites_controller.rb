class CustomSitesController < ApplicationController
  layout 'custom_site'
  before_action :set_custom_site

  def index
    @body_class = 'login'
    @benefits = @custom_site.benefits
  end

  def show
    if Rails.env == "development"
      @benefits = Benefit.all
    else
      @benefits = @custom_site.benefits
    end
  end

  def savings
    session[:uuid] = current_user.uuid unless session[:uuid].present?
    @page_title = "Member Benefits"
    @sections = @custom_site.savings_benefits.first.sections
    @body_class = "sites savings-body interior"
  end

  def health
    @benefits = @custom_site.health_benefits
    @body_class = "sites health-body interior"
    @page_title = "Health"
  end

  def insurance
    @benefits = @custom_site.insurance_benefits
    @body_class = "sites insurance-body interior"
    @page_title = "Insurance"
  end

  def security
    if Rails.env == "development"
      @benefits = Benefit.where(:category_id => 4)
    else
      @benefits = @custom_site.security_benefits
    end
    @body_class = "sites security-body interior"
    @page_title = "Security"
  end

  def custom_site_params
    params.require(:site).permit(:name, :url, :company_name, :city, :state, :zip_code, :primary_color, :secondary_color, :link_color, :login_code, :link_color_hover, :club_name, :bank_website, :template, :account_number, :logo)
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
      @login_code = @custom_site.login_code
    end
  end
end
