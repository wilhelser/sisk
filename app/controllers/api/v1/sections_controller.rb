class API::V1::SectionsController < API::V1::ApiController
  before_filter :set_section, only: :show
  respond_to :json

  def index
    @benefit = Benefit.find(params[:benefit_id])
    @sections = @benefit.sections
    render json: @sections, status: 200
  end

  def show
    render json: @site, status: 200
  end

  private

  def set_section
    @section = Section.find(params[:id])
  end
end
