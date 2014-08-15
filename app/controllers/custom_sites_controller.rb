class CustomSitesController < InheritedResources::Base

  def custom_site_params
    params.require(:site).permit(:name, :url, :company_name, :city, :state, :zip_code, :primary_color, :secondary_color, :link_color, :link_color_hover, :club_name, :bank_website, :template, :logo, :account_number)
  end
end
