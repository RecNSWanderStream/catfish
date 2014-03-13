json.array!(@asset_cell_providers) do |asset_cell_provider|
  json.extract! asset_cell_provider, :id, :asset_id, :cell_provider_id
  json.url asset_cell_provider_url(asset_cell_provider, format: :json)
end
