class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :asset_type_id
      t.integer :profile_id
      t.integer :region_id
      t.string :name
      t.text :description
      t.decimal :lat, :precision => 9, :scale => 6
      t.decimal :lng, :precision => 9, :scale => 6
      t.integer :created_by
      t.integer :updated_by

      t.timestamps
    end
  end
end
