json.array!(@benefits) do |benefit|
  json.extract! benefit, :id, :title, :subtitle, :content, :link
  json.url benefit_url(benefit, format: :json)
end
