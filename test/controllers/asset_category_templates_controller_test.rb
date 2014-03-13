require 'test_helper'

class AssetCategoryTemplatesControllerTest < ActionController::TestCase
  setup do
    @asset_category_template = asset_category_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_category_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_category_template" do
    assert_difference('AssetCategoryTemplate.count') do
      post :create, asset_category_template: { activity_category_id: @asset_category_template.activity_category_id }
    end

    assert_redirected_to asset_category_template_path(assigns(:asset_category_template))
  end

  test "should show asset_category_template" do
    get :show, id: @asset_category_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_category_template
    assert_response :success
  end

  test "should update asset_category_template" do
    patch :update, id: @asset_category_template, asset_category_template: { activity_category_id: @asset_category_template.activity_category_id }
    assert_redirected_to asset_category_template_path(assigns(:asset_category_template))
  end

  test "should destroy asset_category_template" do
    assert_difference('AssetCategoryTemplate.count', -1) do
      delete :destroy, id: @asset_category_template
    end

    assert_redirected_to asset_category_templates_path
  end
end
