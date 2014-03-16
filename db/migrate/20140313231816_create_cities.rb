class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :province_id
      t.string :name
      t.geometry :location

      t.timestamps
    end
  end
end
