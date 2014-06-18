class SitesController < ApplicationController
  require 'nokogiri'
  require 'atom'
  require 'rss'
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
    @zip_code = params[:search][:zip_code]
    @category = params[:search][:category]
    @distance = params[:search][:distance] ||= 25
    rss = HTTParty.get("http://api.entertainment.com/AtomServer3/feeds/offers?uuid=1401914342909&location=#{@zip_code}&distance=25&category=#{@category}", basic_auth: { username: "INFO@SISK.COM", password: "T1aPw4SjF" })
    @feed = RSS::Parser.parse(rss, false)
    # @feed = Atom::Feed.load_feed(URI.parse("http://api.entertainment.com/AtomServer3/feeds/offers?uuid=1401914342909&location=#{@zip_code}&distance=#{@distance}&category=#{@category}"), :user => 'INFO@SISK.COM', :pass => 'T1aPw4SjF')
    # @feed = Feedjira::Feed.fetch_and_parse("http://api.entertainment.com/AtomServer3/feeds/offers?uuid=1401914342909&location=#{@zip_code}&distance=#{@distance}&category=#{@category}", :http_authentication => ["INFO@SISK.COM", "T1aPw4SjF"])
    # @response = RSS::Parser.parse(rss, false)
    @benefits = @feed.entries
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
