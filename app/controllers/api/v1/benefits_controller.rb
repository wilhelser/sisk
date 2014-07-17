class API::V1::BenefitsController < API::V1::ApiController
  before_filter :after_token_authentication
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


  def after_token_authentication
    if params[:auth_token].present?
      @user = User.find_by_authentication_token(params[:auth_token])
      if @user
        sign_in @user
      else
        render json: "Bad auth token", status: 200
      end
    end
  end
end
