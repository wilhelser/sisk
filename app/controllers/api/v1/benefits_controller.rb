class API::V1::BenefitsController < API::V1::ApiController
  before_filter :validate_auth_token
  before_filter :set_benefit, only: :show
  respond_to :json

  def index
    @site = @user.site
    @benefits = @site.benefits
    render json: @benefits, status: 200
  end

  def show
    render json: @site, status: 200
  end

  private

  def set_benefit
    @benefit = Benefit.find(params[:id])
  end

  def validate_auth_token
    @user = User.find_by_authentication_token(params[:auth_token])
    render :status => 401, :json => {errors: [t('api.v1.token.invalid_token')]} if @user.nil?
  end
end
