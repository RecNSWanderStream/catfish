class AssetCategoryTemplatesController < ApplicationController
  before_action :set_asset_category_template, only: [:show, :edit, :update, :destroy]

  # GET /asset_category_templates
  # GET /asset_category_templates.json
  def index
    @asset_category_templates = AssetCategoryTemplate.all
  end

  # GET /asset_category_templates/1
  # GET /asset_category_templates/1.json
  def show
  end

  # GET /asset_category_templates/new
  def new
    @asset_category_template = AssetCategoryTemplate.new
  end

  # GET /asset_category_templates/1/edit
  def edit
  end

  # POST /asset_category_templates
  # POST /asset_category_templates.json
  def create
    @asset_category_template = AssetCategoryTemplate.new(asset_category_template_params)

    respond_to do |format|
      if @asset_category_template.save
        format.html { redirect_to @asset_category_template, notice: 'Asset category template was successfully created.' }
        format.json { render action: 'show', status: :created, location: @asset_category_template }
      else
        format.html { render action: 'new' }
        format.json { render json: @asset_category_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /asset_category_templates/1
  # PATCH/PUT /asset_category_templates/1.json
  def update
    respond_to do |format|
      if @asset_category_template.update(asset_category_template_params)
        format.html { redirect_to @asset_category_template, notice: 'Asset category template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @asset_category_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asset_category_templates/1
  # DELETE /asset_category_templates/1.json
  def destroy
    @asset_category_template.destroy
    respond_to do |format|
      format.html { redirect_to asset_category_templates_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset_category_template
      @asset_category_template = AssetCategoryTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_category_template_params
      params.require(:asset_category_template).permit(:activity_category_id)
    end
end
