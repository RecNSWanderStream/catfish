class AssetTypesController < ApplicationController
  before_action :set_asset_type, only: [:show, :edit, :update, :destroy]

  # GET /asset_types
  # GET /asset_types.json
  def index
    @asset_types = AssetType.all
  end

  # GET /asset_types/1
  # GET /asset_types/1.json
  def show
  end

  # GET /asset_types/new
  def new
    @asset_type = AssetType.new
  end

  # GET /asset_types/1/edit
  def edit
  end

  # POST /asset_types
  # POST /asset_types.json
  def create
    @asset_type = AssetType.new(asset_type_params)

    respond_to do |format|
      if @asset_type.save
        format.html { redirect_to @asset_type, notice: 'Asset type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_types/1
  # PATCH/PUT /asset_types/1.json
  def update
    respond_to do |format|
      if @asset_type.update(asset_type_params)
        format.html { redirect_to @asset_type, notice: 'Asset type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_types/1
  # DELETE /asset_types/1.json
  def destroy
    @asset_type.destroy
    respond_to do |format|
      format.html { redirect_to asset_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_type
      @asset_type = AssetType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_type_params
      params.require(:asset_type).permit(:name, :description)
    end
end
