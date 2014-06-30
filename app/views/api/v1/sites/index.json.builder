json.sites @sites do |site|
  json.id site.id
  site_id site.site_id
  json.name site.name
  json.url site.url
  json.created_at site.created_at
  json.updated_at site.updated_at
  json.site_code site.site_code
  json.city site.city
  json.state site.state
  json.zip_code site.zip_code
  json.account_number site.account_number
  json.logo site.logo
  json.primary_color site.primary_color
  json.secondary_color site.secondary_color
  json.link_color site.link_color
  json.link_color_hover site.link_color_hover
  json.club_name site.club_name
  json.bank_website site.bank_website
  json.slug site.slug
end
