json.array!(@assets) do |asset|
  json.extract! asset, :id, :asset_type_id, :profile_id, :region_id, :name, :description, :lat, :lng, :created_by, :updated_by
  json.url asset_url(asset, format: :json)
end
