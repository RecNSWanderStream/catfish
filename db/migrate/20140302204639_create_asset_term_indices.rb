class CreateAssetTermIndices < ActiveRecord::Migration
  def change
    create_table :asset_term_indices do |t|
      t.string :term
      t.integer :origin_string_size
      t.integer :asset_id

      t.timestamps
    end
  end
end
