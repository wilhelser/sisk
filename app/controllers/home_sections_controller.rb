class HomeSectionsController < InheritedResources::Base

  private
  def home_sections_params
    params.require(:home_section).permit(:name, :url, :site_code)
  end
end
