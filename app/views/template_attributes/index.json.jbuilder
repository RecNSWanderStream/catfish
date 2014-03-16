json.array!(@template_attributes) do |template_attribute|
  json.extract! template_attribute, :id, :asset_category_template_id, :name, :type
  json.url template_attribute_url(template_attribute, format: :json)
end
