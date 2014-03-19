class AddMoreToAssetActivities < ActiveRecord::Migration
  def change
    add_column :asset_activities, :gpx_link, :string
    add_column :asset_activities, :topo_link, :string
    add_column :asset_activities, :min_altitude, :decimal, :precision => 6, :scale => 2
    add_column :asset_activities, :max_altitude, :decimal, :precision => 6, :scale => 2
    add_column :asset_activities, :nearest_public_transit_location, :text
    add_column :asset_activities, :trail_surface, :text
    add_column :asset_activities, :level_of_maintenance, :text
    add_column :asset_activities, :last_maintenance_date, :date
    add_column :asset_activities, :maintained_by, :string

    add_column :assets, :rentals, :text
    add_column :assets, :food, :text
  end
end
