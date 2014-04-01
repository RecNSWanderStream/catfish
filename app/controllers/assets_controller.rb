class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy]  
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  
  # GET /assets
  # GET /assets.json
  def index
    @assets = Asset.all
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
    @asset_activity = AssetActivity.new
    @activity_types = ActivityType.all
  end

  # GET /assets/new
  def new
    @asset = Asset.new
    @asset_types = AssetType.all.distinct.order(:name)
    @regions = Region.all.distinct.order(:name)
    @cities = City.all.distinct.order(:name)
  end

  # GET /assets/1/edit
  def edit
    @asset_types =AssetType.all.distinct
    @regions = Region.all.distinct
    @cities = City.all.distinct
  end

  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(asset_params)

    respond_to do |format|
      if @asset.save
        tokens = @asset.name.split
        num_elements = tokens.size
        tokens.each do |token|
          AssetTermIndex.create(term: token.downcase, origin_string_size: num_elements, asset_id: @asset.id)
        end
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  #This method invokes the wiki functionality of this project
  #each time update is called it creates a completely new asset with the updated info
  #this is in order to preserve the old asset in case the update removed relevant data or
  #tampered with the asset in any way
  #The new asset gets a new revision number and that revision number is set to be the active one
  #to ensure that the pre-updated version does not show up in searches
  #this essentially sets the updated asset to 'active' and 'deactivates' the pre-update asset.
  def update
    respond_to do |format|
      @old_ID = @asset.id
      asset_params[:id] = nil
      #get all activities from the asset and update their asset id
      @asset_activities = @asset.asset_activities
      if @asset = Asset.create(asset_params)       
        #keep track of old assetID id for current asset
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }        
        #turn off current revision
        @old_revision_id = Revision.find_by(asset_id:  @old_ID)
        #create revision record
        @new_revision = Revision.new()
        #inset new revision into table
        @new_revision.old_revision_id = @old_revision_id
        @new_revision.asset_id = @asset.id
        @new_revision.save()
        #update the activity ID that pertains to the asset ID
        @asset_activities.update_all(:asset_id => @asset.id)

      else
        format.html { render action: 'edit' }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:asset_type_id, :profile_id, :region_id, :name, :description, :lat, :lng, :created_by, :updated_by, :nearest_city_id, :washrooms, :parking, :accessibility_access, :accessibility_information, :time_open, :time_closed, :public_transit, :closest_stop_location, :location)
    end
end
