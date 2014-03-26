class Asset < ActiveRecord::Base
  has_many :asset_activities
  has_many :activity_types, :through => :asset_activities
  has_many :activity_categories, :through => :activity_types
  belongs_to :city , :foreign_key => "nearest_city_id", :primary_key => "id"
  belongs_to :region


  before_save :downcase_name

  def self.switch_off
  	self.update(is_active: false)
  end

  def self.search(params)
    tokens = params.split
    in_string = tokens.map!{|t|  t.downcase }
  
    results = self.find_by_sql([ "select distinct a.id as asset_id, a.id, a.name as asset_name, a.description, a.lat,a.lng, r.name as region_name,a.is_active,a.washrooms,a.parking,a.accessibility_access, a.accessibility_information,a.time_open,a.time_closed,a.public_transit,a.nearest_city_id " +  
     ", sum((case when r.name in (?) then 1 else 0 end)+(case when at.name in (?) then 1 else 0 end) + (1/cast(ati.origin_string_size as float))) as match_rating " +    
     "from asset_term_indices ati " +     
     "join assets a " +     
     "on a.id = ati.asset_id " +     
     "left join asset_activities aa " +      
     "on aa.asset_id = a.id " + 
     "left join activity_types at " +     
     "on aa.activity_type_id = at.id " +
     "left join regions r " +
     "on a.region_id = r.id " +   
     "where ati.term in (?) or at.name in (?) or r.name in (?) " +     
     "group by r.name, a.id order by match_rating ", in_string,in_string,in_string,in_string,in_string])
  
    return results
  end

  def downcase_name
    name.downcase!
  end
end


