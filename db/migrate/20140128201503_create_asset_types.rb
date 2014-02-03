class CreateAssetTypes < ActiveRecord::Migration
  def change
    create_table :asset_types do |t|
      t.string :name
      t.text :description

      t.timestamps

      
    end
    add_index :asset_types, :name, :unique => true
  end
end
