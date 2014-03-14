require 'test_helper'

class AssetCellProvidersControllerTest < ActionController::TestCase
  setup do
    @asset_cell_provider = asset_cell_providers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_cell_providers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_cell_provider" do
    assert_difference('AssetCellProvider.count') do
      post :create, asset_cell_provider: { asset_id: @asset_cell_provider.asset_id, cell_provider_id: @asset_cell_provider.cell_provider_id }
    end

    assert_redirected_to asset_cell_provider_path(assigns(:asset_cell_provider))
  end

  test "should show asset_cell_provider" do
    get :show, id: @asset_cell_provider
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_cell_provider
    assert_response :success
  end

  test "should update asset_cell_provider" do
    patch :update, id: @asset_cell_provider, asset_cell_provider: { asset_id: @asset_cell_provider.asset_id, cell_provider_id: @asset_cell_provider.cell_provider_id }
    assert_redirected_to asset_cell_provider_path(assigns(:asset_cell_provider))
  end

  test "should destroy asset_cell_provider" do
    assert_difference('AssetCellProvider.count', -1) do
      delete :destroy, id: @asset_cell_provider
    end

    assert_redirected_to asset_cell_providers_path
  end
end
