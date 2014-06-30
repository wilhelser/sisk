class API::V1::SitesController < ApplicationController
  respond_to :html, :js, :json
  before_action :set_site, only: [:show]

  def index
    render json: Site.all.includes(:benefits), status: 200
  end

  def show
    render json: @site, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end
end
