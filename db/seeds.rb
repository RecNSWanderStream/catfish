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

activity_categories = ActivityCategory.create([{name: 'hiking', description: 'Activities on trails', asset_type_id: trail.id},
                                               {name: 'boating', description: 'Activities using boats', asset_type_id: trail.id},
                                               {name: 'winter sports', description: 'Winter outdoor activities', asset_type_id: place.id},
                                              ])


types = { 
  "hiking"         => [
                       {activity_category_id: -1, name: "trail running", description: "Running on the trail"},
                       {activity_category_id: -1, name: "snow shoeing", description: "Walking the trail with snowshoes"},
                       {activity_category_id: -1, name: "walking", description: "Walking the trail"},
                      ],
  "boating"       => [
                      {activity_category_id: -1, name: "canoeing", description: "Boating with a canoe"},
                      {activity_category_id: -1, name: "kayaking", description: "Boating with a kayak"},
                     ],
  "winter sports" => [
                      {activity_category_id: -1, name: "ice skating", description: "Skating on ice"}
                     ]
}

activity_categories.each do |category|
  types[category.name].each do |type|
    type[:activity_category_id] = category.id
    category.activity_types.create(type)
  end
end

point_pleasant_and_bluff_type = AssetType.find_by name: "trail"
kejimkujik_type = AssetType.find_by name: "trail"
the_oval_type = AssetType.find_by name: "place"

walking = ActivityType.find_by name: "walking"
trail_running = ActivityType.find_by name: "trail running"
ice_skating = ActivityType.find_by name: "ice skating"

point_pleasant = Asset.create({asset_type_id: point_pleasant_and_bluff_type.id,
                          profile_id: 0,
                          region_id: 0,
                          name: "Point pleasant park",
                          description: "A nice view of the Atlantic.  Easy to get around.  Great place to let your dog run free.",
                          lat: '44.626902',
                          lng: '-63.571645',
                          created_by: 0,
                          updated_by: 0
                        })


point_pleasant.asset_activities.create({activity_type_id: walking.id, duration: 3600, difficulty: "easy", quality: "excellent", season: "all"})

kejimkujik = Asset.create({asset_type_id: kejimkujik_type.id,
                          profile_id: 0,
                          region_id: 0,
                          name: "Kejimkujik",
                          description: "A nice camping and hiking area.",
                          lat: '44.343523',
                          lng: '-65.193912',
                          created_by: 0,
                          updated_by: 0
                        })

kejimkujik.asset_activities.create({activity_type_id: walking.id, duration: 4500, difficulty: "easy", quality: "great", season: "summer"})

the_oval = Asset.create({asset_type_id: the_oval_type.id,
                          profile_id: 0,
                          region_id: 0,
                          name: "The oval",
                          description: "The oval is pretty cool, you can ice skate in the winter or roller blade in the summer.",
                          lat: '44.649179',
                          lng: '-63.588025',
                          created_by: 0,
                          updated_by: 0
                        })


the_oval.asset_activities.create({activity_type_id: ice_skating.id, duration: 7200, difficulty: "medium", quality: "excellent", season: "winter"})

the_halifax_forum = Asset.create({asset_type_id: the_oval.id,
                          profile_id: 0,
                          region_id: 0,
                          name: "Halifax Forum",
                          description: "The Halifax Forum is a place to skate.",
                          lat: '44.655031',
                          lng: '-63.604119',
                          created_by: 0,
                          updated_by: 0
                        })
the_halifax_forum.asset_activities.create({activity_type_id: ice_skating.id, duration: 7200, difficulty: "medium", quality: "excellent", season: "winter"})



bluff_wilderness = Asset.create({asset_type_id: point_pleasant_and_bluff_type.id,
                          profile_id: 0,
                          region_id: 0,
                          name: "Bluff Wilderness",
                          description: "Rugged and littered with ancient granite lakes formed by glaciers in the early Holocene.",
                          lat: '44.74783',
                          lng: '-63.92884',
                          created_by: 0,
                          updated_by: 0
                        })


bluff_wilderness.asset_activities.create({activity_type_id: trail_running.id, duration: 7200, difficulty: "hard", quality: "rugged", season: "all"})

