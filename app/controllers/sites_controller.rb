require_dependency'epi_atom_retriever'
require_dependency'feedjira/parser/sisk'

class SitesController < ApplicationController
  before_action :set_site

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
  end

  def savings
    session[:uuid] = current_user.uuid unless session[:uuid].present?
    @page_title = "Member Benefits"
    @sections = @site.savings_benefits.first.sections
  end

  def pull_savings
    @feed_entries = feed_entries
  end

  def health
    @benefits = @site.health_benefits
  end

  def insurance
    @benefits = @site.insurance_benefits
  end

  def security
    if Rails.env == "development"
      @benefits = Benefit.where(:category_id => 4)
    else
      @benefits = @site.security_benefits
    end
  end

private

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
    @body_class = 'sites'
    if user_signed_in?
      @uuid = current_user.uuid
    end
  end

  def site_params
    params.require(:site).permit(:name, :url, :site_code)
  end

end
