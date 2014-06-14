class SectionsController < InheritedResources::Base
  before_action :set_section

  private
  def set_section
    @section = Section.find(params[:id])
  end

  def section_params
    params.require(:site).permit(:name, :url, :site_code, :benefit_ids)
  end
end
