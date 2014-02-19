class Asset < ActiveRecord::Base
  has_many :asset_activities
  has_many :activity_types, :through => :asset_activities
  has_many :activity_categories, :through => :activity_types

  #method to querey the database, put code inside class, it works better
  def self.search_by_activity_type(activity)
    self.joins(:asset_activities).joins(:activity_types).joins(:activity_categories).where("activity_types.name = '#{activity}' OR assets.name LIKE '%#{activity}%' OR activity_categories.name = '#{activity}'")
  end
  
end



