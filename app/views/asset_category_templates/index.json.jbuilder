json.array!(@asset_category_templates) do |asset_category_template|
  json.extract! asset_category_template, :id, :activity_category_id
  json.url asset_category_template_url(asset_category_template, format: :json)
end
