class CreateAssetCategoryTemplates < ActiveRecord::Migration
  def change
    create_table :asset_category_templates do |t|
      t.integer :activity_category_id

      t.timestamps
    end
  end
end
