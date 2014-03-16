class AddToAssetActivities < ActiveRecord::Migration
  def change
    add_column :asset_activities, :user_rating, :decimal, :precision => 5, :scale => 2
    add_column :asset_activities, :difficulty_rating, :decimal, :precision => 5, :scale => 2
    add_column :asset_activities, :is_loop, :boolean
    add_column :asset_activities, :attributes, :binary, :limit => 1.megabyte
    add_column :asset_activities, :distance, :decimal, :precision => 5, :scale => 2

    remove_column :asset_activities, :season
    remove_column :asset_activities, :quality
    remove_column :asset_activities, :general_information
    remove_column :asset_activities, :safety_information
    remove_column :asset_activities, :alerts
  end
end
