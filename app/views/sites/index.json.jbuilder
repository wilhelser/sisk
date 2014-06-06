json.array!(@sites) do |site|
  json.extract! site, :id, :site_id, :name, :url
  json.url site_url(site, format: :json)
end
