class Region < ActiveRecord::Base

 def name_for_select
    name.titleize
  end
end
