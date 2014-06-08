class SitesController < ApplicationController
  require 'nokogiri'
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  layout 'sites'

  # GET /sites
  # GET /sites.json
  def index
    if params[:site_code].present?
      @show_registration_form = true
    else
      @show_registration_form = false
    end
    @sites = Site.all
  end

  def about

  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    @benefits = Benefit.all
  end

  def savings
    @page_title = "Savings Made Easy"
    rss = HTTParty.get("http://api.entertainment.com/AtomServer3/feeds/offers?uuid=1401914342909", basic_auth: { username: "INFO@SISK.COM", password: "T1aPw4SjF" })
    feed = Feedjira::Feed.parse rss
    @entries = feed.entries
  end

  def health

  end

  def insurance

  end

  def security

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
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:name, :url, :site_code)
    end
end
