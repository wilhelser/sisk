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
    if Rails.env == "development"
      @benefits = Benefit.all
    else
      @benefits = @site.benefits
    end
    @body_class = "sites landing-body"
  end

  def savings
    session[:uuid] = current_user.uuid unless session[:uuid].present?
    @page_title = "Member Benefits"
    @sections = @site.savings_benefits.first.sections
    @body_class = "sites savings-body"
  end

  def pull_savings
    @feed_entries = feed_entries
  end

  def health
    @benefits = @site.health_benefits
    @body_class = "sites health-body"
  end

  def insurance
    @benefits = @site.insurance_benefits
    @body_class = "sites insurance-body"
  end

  def security
    if Rails.env == "development"
      @benefits = Benefit.where(:category_id => 4)
    else
      @benefits = @site.security_benefits
    end
    @body_class = "sites security-body"
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
    @site = Site.find(params[:id])
    @site_session = session[:custom_site] unless session[:custom_site].blank?
    @body_class = 'sites'
    if user_signed_in?
      @uuid = current_user.uuid
    end
  end

  def add_custom_site_params
    unless session[:custom_site].blank?
      site = session[:custom_site]
      @link_color = site.link_color
      @link_hover_color = site.link_hover_color
      @primary_color = site.primary_color
      @secondary_color = site.secondary_color
      @template = site.template
    end
  end

  def site_params
    params.require(:site).permit(:name, :url, :site_code)
  end

end
