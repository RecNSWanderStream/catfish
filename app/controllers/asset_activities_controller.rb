class AssetActivitiesController < ApplicationController
  before_action :set_asset_activity, only: [:show, :edit, :update, :destroy]

  # GET /asset_activities
  # GET /asset_activities.json
  def index
    @asset_activities = AssetActivity.all
  end

  # GET /asset_activities/1
  # GET /asset_activities/1.json
  def show
  end

  # GET /asset_activities/new
  def new
    @asset_activity = AssetActivity.new
  end

  # GET /asset_activities/1/edit
  def edit
  end

  # POST /asset_activities
  # POST /asset_activities.json
  def create
    
    puts asset_activity_params   
    
    @asset_activity = AssetActivity.new(asset_activity_params)
    respond_to do |format|
      
      if @asset_activity.save
        format.html { redirect_to @asset_activity, notice: 'Asset activity was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset_activity }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_activities/1
  # PATCH/PUT /asset_activities/1.json
  def update
    respond_to do |format|
      if @asset_activity.update(asset_activity_params)
        format.html { redirect_to @asset_activity, notice: 'Asset activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset_activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_activities/1
  # DELETE /asset_activities/1.json
  def destroy
    @asset_activity.destroy
    respond_to do |format|
      format.html { redirect_to asset_activities_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_activity
      @asset_activity = AssetActivity.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_activity_params
      params.require(:asset_activity).permit(:asset_id, :activity_type_id, :duration, :difficulty, :quality, :season, :general_information, :safety_information, :alerts, :user_rating, :difficulty_rating, :distance  )
    end
end
