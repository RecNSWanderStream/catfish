class Asset < ActiveRecord::Base
  has_many :asset_activities
  has_many :activity_types, :through => :asset_activities
  has_many :activity_categories, :through => :activity_types
#<-- 
#  #validation for adding long and lat
#  validates :lat, format: { with: /\A-?([1-8]?[1-9]|[1-9]0)\.{1}\d{1,6}/, message: "Must be valid latitude value with 1-6 decimals of precision"}

# validates :lng, format: { with: /\A(\+|-)?(\d\.\d{1,6}|[1-9]\d\.\d{1,6}|1[1-7]\d\.\d{1,6}|180\.0{1,6})\Z/, message: "Must be valid longitude value with 1-6 decimals of precision"}
#-->


  #method to querey the database, put code inside class, it works better
  def self.search_by_activity_type(activity)
    self.joins(:asset_activities).joins(:activity_types).joins(:activity_categories).where(["activity_types.name = ? OR assets.name LIKE ? OR activity_categories.name = ?",activity,activity,activity])
  end

  def self.switch_off
  	self.update(is_active: false)
  end

  def self.search(params)

    tokens = params.split
    #in_string = tokens.map!{|t| "'" + t + "'"}.join(',')
    results = self.find_by_sql(["select * "+ 
    ", sum(1/cast(ati.origin_string_size as float)) as match_rating " +
   "from asset_term_indices ati " +
    "join assets a " +
      "on a.id = ati.asset_id " +
    "left join asset_activities aa " +
      "on aa.asset_id = a.id " +
    "left join activity_types at " +
      "on aa.asset_id = at.id " +
    "where ati.term in (?) or at.name in (?) " +
    "group by a.id, ati.id, aa.id, at.id, " +
    "ati.asset_id order by match_rating", tokens, tokens])
  end
end

#select * , sum(1/cast(ati.origin_string_size as float)) as match_rating from asset_term_indices ati where ati.term in ('Taco') group by ati.id, ati.asset_id 


