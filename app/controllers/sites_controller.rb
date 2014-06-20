require 'epi_atom_retriever'
require 'feedjira/parser/sisk'

class SitesController < ApplicationController
  before_action :set_site

  def about

  end

  def usage

  end

  def show
    @benefits = @site.benefits
  end

  def savings
    @page_title = "Savings Made Easy"
    @sections = @site.savings_benefits.first.sections
  end

  def pull_savings
    rss = EpiAtomRetriever.(params[:search][:zip_code],
                            params[:search][:distance],
                            params[:search][:category])
    @feed = Feedjira::Parser::Sisk.parse(rss)
  end

  def health
    @benefits = @site.health_benefits
  end

  def insurance
    @benefits = @site.insurance_benefits
  end

  def security
    @benefits = @site.security_benefits
  end

private

  def set_site
    @site = Site.find(params[:id])
    @body_class = 'sites'
  end

  def site_params
    params.require(:site).permit(:name, :url, :site_code)
  end

end
