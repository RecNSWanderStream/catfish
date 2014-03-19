json.array!(@cities) do |city|
  json.extract! city, :id, :province_id, :name, :location
  json.url city_url(city, format: :json)
end
