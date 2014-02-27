class WikiController < ApplicationController
  def get_asset
  	 #get asset (this will have to be )
  	@asset = asset.find(asset_id)
  end

  def view
  	#variable for name
  	@name = @asset.name
  	#variable for asset description
  	@description = @asset.description
  end


  def edit
  end
end
