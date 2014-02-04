class ActivityType < ActiveRecord::Base
  belongs_to :asset_activity
  belongs_to :activity_category
end
