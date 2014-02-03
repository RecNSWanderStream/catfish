class CreateActivityCategories < ActiveRecord::Migration
  def change
    create_table :activity_categories do |t|
      t.integer :asset_type_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :activity_categories, :name, :unique => true
  end
end
