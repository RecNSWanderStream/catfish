json.array!(@asset_types) do |asset_type|
  json.extract! asset_type, :id, :name, :description
  json.url asset_type_url(asset_type, format: :json)
end
