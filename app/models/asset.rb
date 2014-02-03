class Asset < ActiveRecord::Base
  has_many :asset_activities
end
