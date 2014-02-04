require 'test_helper'

class AssetActivitiesControllerTest < ActionController::TestCase
  setup do
    @asset_activity = asset_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_activity" do
    assert_difference('AssetActivity.count') do
      post :create, asset_activity: { activity_type_id: @asset_activity.activity_type_id, alerts: @asset_activity.alerts, asset_id: @asset_activity.asset_id, difficulty: @asset_activity.difficulty, duration: @asset_activity.duration, general_information: @asset_activity.general_information, quality: @asset_activity.quality, safety_information: @asset_activity.safety_information, season: @asset_activity.season }
    end

    assert_redirected_to asset_activity_path(assigns(:asset_activity))
  end

  test "should show asset_activity" do
    get :show, id: @asset_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_activity
    assert_response :success
  end

  test "should update asset_activity" do
    patch :update, id: @asset_activity, asset_activity: { activity_type_id: @asset_activity.activity_type_id, alerts: @asset_activity.alerts, asset_id: @asset_activity.asset_id, difficulty: @asset_activity.difficulty, duration: @asset_activity.duration, general_information: @asset_activity.general_information, quality: @asset_activity.quality, safety_information: @asset_activity.safety_information, season: @asset_activity.season }
    assert_redirected_to asset_activity_path(assigns(:asset_activity))
  end

  test "should destroy asset_activity" do
    assert_difference('AssetActivity.count', -1) do
      delete :destroy, id: @asset_activity
    end

    assert_redirected_to asset_activities_path
  end
end
