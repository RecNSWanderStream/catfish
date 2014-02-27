class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :asset_id
      t.integer :old_revision_id

      t.timestamps
    end
  end
end
