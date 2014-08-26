class API::V1::SiteConfigsController < API::V1::ApiController
  respond_to :json

  def show
    @config = SiteConfig.find(params[:id])
    render json: @config, status: 200
  end

  def site_config_params
    params.require(:site_config).permit(:identity_iq_protect_link, :identity_iq_pro_link, :identity_iq_protect_max_link)
  end
end
