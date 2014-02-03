class ActivityCategory < ActiveRecord::Base
  has_many :activity_types
end
