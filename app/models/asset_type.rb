class AssetType < ActiveRecord::Base
  has_many :activity_categories

  def name_for_select
    name.capitalize
  end
end
