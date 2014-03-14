class AssetCellProvidersController < ApplicationController
  before_action :set_asset_cell_provider, only: [:show, :edit, :update, :destroy]

  # GET /asset_cell_providers
  # GET /asset_cell_providers.json
  def index
    @asset_cell_providers = AssetCellProvider.all
  end

  # GET /asset_cell_providers/1
  # GET /asset_cell_providers/1.json
  def show
  end

  # GET /asset_cell_providers/new
  def new
    @asset_cell_provider = AssetCellProvider.new
  end

  # GET /asset_cell_providers/1/edit
  def edit
  end

  # POST /asset_cell_providers
  # POST /asset_cell_providers.json
  def create
    @asset_cell_provider = AssetCellProvider.new(asset_cell_provider_params)

    respond_to do |format|
      if @asset_cell_provider.save
        format.html { redirect_to @asset_cell_provider, notice: 'Asset cell provider was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset_cell_provider }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset_cell_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_cell_providers/1
  # PATCH/PUT /asset_cell_providers/1.json
  def update
    respond_to do |format|
      if @asset_cell_provider.update(asset_cell_provider_params)
        format.html { redirect_to @asset_cell_provider, notice: 'Asset cell provider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset_cell_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_cell_providers/1
  # DELETE /asset_cell_providers/1.json
  def destroy
    @asset_cell_provider.destroy
    respond_to do |format|
      format.html { redirect_to asset_cell_providers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_cell_provider
      @asset_cell_provider = AssetCellProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_cell_provider_params
      params.require(:asset_cell_provider).permit(:asset_id, :cell_provider_id)
    end
end
