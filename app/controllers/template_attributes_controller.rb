class TemplateAttributesController < ApplicationController
  before_action :set_template_attribute, only: [:show, :edit, :update, :destroy]

  # GET /template_attributes
  # GET /template_attributes.json
  def index
    @template_attributes = TemplateAttribute.all
  end

  # GET /template_attributes/1
  # GET /template_attributes/1.json
  def show
  end

  # GET /template_attributes/new
  def new
    @template_attribute = TemplateAttribute.new
  end

  # GET /template_attributes/1/edit
  def edit
  end

  # POST /template_attributes
  # POST /template_attributes.json
  def create
    @template_attribute = TemplateAttribute.new(template_attribute_params)

    respond_to do |format|
      if @template_attribute.save
        format.html { redirect_to @template_attribute, notice: 'Template attribute was successfully created.' }
        format.json { render action: 'show', status: :created, location: @template_attribute }
      else
        format.html { render action: 'new' }
        format.json { render json: @template_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /template_attributes/1
  # PATCH/PUT /template_attributes/1.json
  def update
    respond_to do |format|
      if @template_attribute.update(template_attribute_params)
        format.html { redirect_to @template_attribute, notice: 'Template attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @template_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /template_attributes/1
  # DELETE /template_attributes/1.json
  def destroy
    @template_attribute.destroy
    respond_to do |format|
      format.html { redirect_to template_attributes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_attribute
      @template_attribute = TemplateAttribute.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def template_attribute_params
      params.require(:template_attribute).permit(:asset_category_template_id, :name, :type)
    end
end
