json.array!(@regions) do |region|
  json.extract! region, :id, :name, :description, :shape
  json.url region_url(region, format: :json)
end
