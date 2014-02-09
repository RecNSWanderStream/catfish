class ActivityType < ActiveRecord::Base
  has_many :assets, :through => :asset_activities
  belongs_to :activity_category
end
