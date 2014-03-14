class CreateTemplateAttributes < ActiveRecord::Migration
  def change
    create_table :template_attributes do |t|
      t.integer :asset_category_template_id
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
