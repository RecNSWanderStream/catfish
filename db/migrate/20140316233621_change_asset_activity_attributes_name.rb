class ChangeAssetActivityAttributesName < ActiveRecord::Migration
  def change
    #oops named column after reserved word
    remove_column :asset_activities, :attributes
    add_column :asset_activities, :dynamic_attributes, :binary, :limit => 1.megabyte
  end
end
