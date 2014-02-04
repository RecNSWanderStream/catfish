json.array!(@activity_categories) do |activity_category|
  json.extract! activity_category, :id, :asset_type_id, :name, :description
  json.url activity_category_url(activity_category, format: :json)
end
