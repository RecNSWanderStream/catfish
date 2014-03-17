json.array!(@regions) do |region|
  json.extract! region, :id, :name, :shape, :created_at, :updated_at
  json.url asset_url(region, format: :json)
end