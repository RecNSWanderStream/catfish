# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

asset_types = AssetType.create([{name: 'venue' }, 
                                {name: 'place'}, 
                                {name: 'trail'}
                                ])

trail = AssetType.find_by name: "trail"
place = AssetType.find_by name: "place"

activity_categories = ActivityCategory.create([{name: 'recreation', description: 'Generic category for all types', asset_type_id: trail.id},])

types = { 
  "recreation" => [{activity_category_id: -1, name: "hiking", description: "Hiking on a trail"},]
}

activity_categories.each do |category|
  types[category.name].each do |type|
    type[:activity_category_id] = category.id
    category.activity_types.create(type)
  end
end

point_pleasant_and_bluff_type = AssetType.find_by name: "trail"
kejimkujik_type = AssetType.find_by name: "trail"
the_oval_type = AssetType.find_by name: "trail"

walking = ActivityType.find_by name: "hiking"
trail_running = ActivityType.find_by name: "hiking"
ice_skating = ActivityType.find_by name: "hiking"

