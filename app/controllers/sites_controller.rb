require 'epi_atom_retriever'
require 'feedjira/parser/sisk'
require 'feedjira'

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
    session[:uuid] = current_user.uuid unless session[:uuid].present?
    @page_title = "Savings Made Easy"
    @sections = @site.savings_benefits.first.sections
  end

  def pull_savings
    categories = []
    categories << params[:search][:category].to_i
    categories << params[:search][:subcategory].to_i unless params[:search][:subcategory].blank?
    categories << params[:search][:cuisine_subcategory].to_i unless params[:search][:cuisine_subcategory].blank?
    rss = EpiAtomRetriever.(params[:search][:zip_code],
                            params[:search][:distance],
                            categories)
    @feed = Feedjira::Parser::Sisk.parse(rss)
    Rails.logger.info @feed.size
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

  def pull_print_coupon
    offer_id = params[:offer_id]
    rss = HTTParty.get("http://api.entertainment.com/AtomServer3/feeds/print?uuid=#{current_user.uuid}&offerid=#{offer_id}", basic_auth: { username: "INFO@SISK.COM", password: "T1aPw4SjF" })
    xml = Feedjira::Feed.parse rss
    @coupon = xml.entries.first
  end

private

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
