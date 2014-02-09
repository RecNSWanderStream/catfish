class AssetActivity < ActiveRecord::Base
  belongs_to :activity_type
  belongs_to :asset
  belongs_to :acttivity_category
end
