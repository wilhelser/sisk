class API::V1::SitesController < ApplicationController
  respond_to :html, :js, :json

  def index
    render json: Site.all
  end
end
