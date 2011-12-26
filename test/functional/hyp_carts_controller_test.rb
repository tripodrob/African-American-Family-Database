require 'test_helper'

class HypCartsControllerTest < ActionController::TestCase
  setup do
    @hyp_cart = hyp_carts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:hyp_carts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create hyp_cart" do
    assert_difference('HypCart.count') do
      post :create, :hyp_cart => @hyp_cart.attributes
    end

    assert_redirected_to hyp_cart_path(assigns(:hyp_cart))
  end

  test "should show hyp_cart" do
    get :show, :id => @hyp_cart.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @hyp_cart.to_param
    assert_response :success
  end

  test "should update hyp_cart" do
    put :update, :id => @hyp_cart.to_param, :hyp_cart => @hyp_cart.attributes
    assert_redirected_to hyp_cart_path(assigns(:hyp_cart))
  end

  test "should destroy hyp_cart" do
    assert_difference('HypCart.count', -1) do
      delete :destroy, :id => @hyp_cart.to_param
    end

    assert_redirected_to hyp_carts_path
  end
end
