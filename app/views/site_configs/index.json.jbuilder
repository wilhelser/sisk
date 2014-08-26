json.array!(@site_configs) do |site_config|
  json.extract! site_config, :id, :identity_iq_protect_link, :identity_iq_pro_link, :identity_iq_protect_max_link
  json.url site_config_url(site_config, format: :json)
end
