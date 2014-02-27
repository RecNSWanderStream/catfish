class AddIsActiveToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :is_active, :boolean
  end
end
