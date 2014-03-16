require 'test_helper'

class TemplateAttributesControllerTest < ActionController::TestCase
  setup do
    @template_attribute = template_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:template_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create template_attribute" do
    assert_difference('TemplateAttribute.count') do
      post :create, template_attribute: { asset_category_template_id: @template_attribute.asset_category_template_id, name: @template_attribute.name, type: @template_attribute.type }
    end

    assert_redirected_to template_attribute_path(assigns(:template_attribute))
  end

  test "should show template_attribute" do
    get :show, id: @template_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @template_attribute
    assert_response :success
  end

  test "should update template_attribute" do
    patch :update, id: @template_attribute, template_attribute: { asset_category_template_id: @template_attribute.asset_category_template_id, name: @template_attribute.name, type: @template_attribute.type }
    assert_redirected_to template_attribute_path(assigns(:template_attribute))
  end

  test "should destroy template_attribute" do
    assert_difference('TemplateAttribute.count', -1) do
      delete :destroy, id: @template_attribute
    end

    assert_redirected_to template_attributes_path
  end
end
