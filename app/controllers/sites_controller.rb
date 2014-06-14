class SitesController < ApplicationController
  require 'nokogiri'
  require 'atom'
  require 'rss'
  before_action :set_site
  layout 'sites'

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
  end

  def about

  end

  def usage

  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @benefits = @site.benefits
  end

  def savings
    @page_title = "Savings Made Easy"
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
    @benefits = Category.find(2).benefits
  end

  def insurance
    @benefits = Category.find(3).benefits
  end

  def security
    @benefits = Category.find(4).benefits
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # GET /sites/1/edit
  def edit
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = Site.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render action: 'show', status: :created, location: @site }
      else
        format.html { render action: 'new' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sites/1
  # PATCH/PUT /sites/1.json
  def update
    respond_to do |format|
      if @site.update(site_params)
        format.html { redirect_to @site, notice: 'Site was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.json
  def destroy
    @site.destroy
    respond_to do |format|
      format.html { redirect_to sites_url }
      format.json { head :no_content }
    end
  end

  private
  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :url, :site_code)
  end
end
