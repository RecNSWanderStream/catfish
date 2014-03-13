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
    @asset_types =AssetType.all.distinct
  end

  # GET /assets/1/edit
  def edit
    @asset_types =AssetType.all.distinct
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
  def update
    respond_to do |format|
      @old_ID = @asset.id
      asset_params[:id] = nil
      #get all activities from the asset and update their asset id
      @asset_activities = @asset.asset_activities
      @asset_activities_id = @asset.id
      if @asset = Asset.create(asset_params)
        #turn off current revision
        #create rivision record
        #inset new rivision into table
        #keep track of old assetID id for current asset
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { head :no_content }
        #create new revision. gonna have to find asset id
        @old_revision_id = Revision.find_by(asset_id:  @old_ID)
        @new_revision = Revision.new()
        @new_revision.old_revision_id = @old_revision_id
        @new_revision.asset_id = @asset.id
        @new_revision.save()
        #update the activity ID that pretains to the asset ID
        @asset_activities.update(params[:asset_id], @asset.id)

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
      params.require(:asset).permit(:asset_type_id, :profile_id, :region_id, :name, :description, :lat, :lng, :created_by, :updated_by)
    end
end
