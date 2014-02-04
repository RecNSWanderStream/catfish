class CreateAssetActivities < ActiveRecord::Migration
  def change
    create_table :asset_activities do |t|
      t.integer :asset_id
      t.integer :activity_type_id
      t.integer :duration
      t.string :difficulty
      t.text :quality
      t.string :season
      t.text :general_information
      t.text :safety_information
      t.text :alerts

      t.timestamps
    end
  end
end
