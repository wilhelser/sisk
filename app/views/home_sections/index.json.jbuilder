json.array!(@home_sections) do |home_section|
  json.extract! home_section, :id, :title, :content, :link, :visible
  json.url home_section_url(home_section, format: :json)
end
