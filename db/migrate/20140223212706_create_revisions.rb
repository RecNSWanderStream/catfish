class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :prev_revision_id
      t.integer :asset_id

      t.timestamps
    end
  end
end
