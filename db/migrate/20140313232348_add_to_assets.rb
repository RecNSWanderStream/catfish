class AddToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :nearest_city_id, :integer
    add_column :assets, :washrooms, :boolean
    add_column :assets, :parking, :boolean
    add_column :assets, :accessibility_access, :boolean
    add_column :assets, :accessibility_information, :text
    add_column :assets, :time_open, :string
    add_column :assets, :time_closed, :string
    add_column :assets, :public_transit, :boolean
    add_column :assets, :closest_stop_location, :geometry
    add_column :assets, :location, :geometry
  end
end
