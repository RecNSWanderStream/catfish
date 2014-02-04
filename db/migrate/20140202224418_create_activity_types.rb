class CreateActivityTypes < ActiveRecord::Migration
  def change
    create_table :activity_types do |t|
      t.integer :activity_category_id
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :activity_types, :name, :unique => true
  end
end
