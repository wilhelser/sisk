json.array!(@custom_sites) do |custom_site|
  json.extract! custom_site, :id, :name, :url, :company_name, :city, :state, :zip_code, :primary_color, :secondary_color, :link_color, :link_color_hover, :club_name, :bank_website
  json.url custom_site_url(custom_site, format: :json)
end
