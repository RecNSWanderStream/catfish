class ActivityType < ActiveRecord::Base
  has_many :assets, :through => :asset_activities
end
