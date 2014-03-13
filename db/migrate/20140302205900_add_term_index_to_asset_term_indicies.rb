class AddTermIndexToAssetTermIndicies < ActiveRecord::Migration
  def change
  	add_index :asset_term_indices, :term
  end
end
