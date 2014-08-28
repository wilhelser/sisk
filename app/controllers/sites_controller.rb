# require_dependency'epi_atom_retriever'
# require_dependency'feedjira/parser/sisk'

class SitesController < ApplicationController
  before_action :set_site
  # layout 'custom_site' unless params[:custom_site].blank?
  before_action :add_custom_site_params

  def about

  end

  def usage

  end

  def show
    # unless session[:custom_site].blank?
    #   render :layout => 'custom_site'
    # end
    if Rails.env == "development"
      @benefits = Benefit.all
    else
      @benefits = @site.benefits
    end
    @body_class = "sites landing-body home"
  end

  def savings
    session[:uuid] = current_user.uuid unless session[:uuid].present?
    @page_title = "Member Benefits"
    @sections = @site.savings_benefits.first.sections
    @body_class = "sites savings-body interior"
  end

  def pull_savings
    @feed_entries = feed_entries
  end

  def health
    @benefits = @site.health_benefits
    @body_class = "sites health-body interior"
    @page_title = "Health"
    # unless session[:custom_site].blank?
    #   render layout: 'custom_site'
    # end
  end

  def insurance
    @benefits = @site.insurance_benefits
    @body_class = "sites insurance-body interior"
    @page_title = "Insurance"
    # unless session[:custom_site].blank?
    #   render :layout => 'custom_site'
    # end
  end

  def security
    if Rails.env == "development"
      @benefits = Benefit.where(:category_id => 4)
    else
      @benefits = @site.security_benefits
    end
    @body_class = "sites security-body interior"
    @page_title = "Security"
    # unless session[:custom_site].blank?
    #   render :layout => 'custom_site'
    # end
  end

private

  def site_session
    session[:custom_site]
  end

  def categories_from_params
    search = params[:search]
    categories = [search.fetch(:category, [])] +
                 [search.fetch(:subcategory, [])] +
                 [search.fetch(:cuisine_subcategory, [])]
    categories.reject {|category| category.to_s.chars.count == 0 }
  end

  def atom_pages
    Rails.logger.info categories_from_params
    EpiAtomRetriever.(params[:search][:zip_code],
                      params[:search][:distance],
                      categories_from_params)
  end

  def feed_entries
    Feedjira::Parser::Sisk.parse_pages(atom_pages)
  end

  def set_site
    unless session[:custom_site].blank?
      custom_site = CustomSite.find(session[:custom_site])
      @site = Site.find_by_name(custom_site.login_code)
      @site_session = session[:custom_site]
    else
      @site = Site.find(params[:id])
    end
    @body_class = 'sites'
    if user_signed_in?
      @uuid = current_user.uuid
    end
  end

  def add_custom_site_params
    unless session[:custom_site].blank?
      @custom_site = CustomSite.find(session[:custom_site])
      @link_color = @custom_site.link_color
      @link_hover_color = @custom_site.link_color_hover
      @primary_color = @custom_site.primary_color
      @secondary_color = @custom_site.secondary_color
      @template = @custom_site.template
      @logo = @custom_site.logo.url
    end
  end

  def site_params
    params.require(:site).permit(:name, :url, :site_code)
  end

end
