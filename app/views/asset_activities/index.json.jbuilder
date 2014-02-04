json.array!(@asset_activities) do |asset_activity|
  json.extract! asset_activity, :id, :asset_id, :activity_type_id, :duration, :difficulty, :quality, :season, :general_information, :safety_information, :alerts
  json.url asset_activity_url(asset_activity, format: :json)
end
