class CreateAssetCellProviders < ActiveRecord::Migration
  def change
    create_table :asset_cell_providers do |t|
      t.integer :asset_id
      t.integer :cell_provider_id

      t.timestamps
    end
  end
end
