require 'test_helper'

class HypItemsControllerTest < ActionController::TestCase
  setup do
    @hyp_item = hyp_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hyp_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hyp_item" do
    assert_difference('HypItem.count') do
      post :create, :hyp_item => @hyp_item.attributes
    end

    assert_redirected_to hyp_item_path(assigns(:hyp_item))
  end

  test "should show hyp_item" do
    get :show, :id => @hyp_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hyp_item.to_param
    assert_response :success
  end

  test "should update hyp_item" do
    put :update, :id => @hyp_item.to_param, :hyp_item => @hyp_item.attributes
    assert_redirected_to hyp_item_path(assigns(:hyp_item))
  end

  test "should destroy hyp_item" do
    assert_difference('HypItem.count', -1) do
      delete :destroy, :id => @hyp_item.to_param
    end

    assert_redirected_to hyp_items_path
  end
end
