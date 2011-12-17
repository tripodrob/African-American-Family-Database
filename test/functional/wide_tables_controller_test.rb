require 'test_helper'

class WideTablesControllerTest < ActionController::TestCase
  setup do
    @wide_table = wide_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wide_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wide_table" do
    assert_difference('WideTable.count') do
      post :create, :wide_table => @wide_table.attributes
    end

    assert_redirected_to wide_table_path(assigns(:wide_table))
  end

  test "should show wide_table" do
    get :show, :id => @wide_table.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @wide_table.to_param
    assert_response :success
  end

  test "should update wide_table" do
    put :update, :id => @wide_table.to_param, :wide_table => @wide_table.attributes
    assert_redirected_to wide_table_path(assigns(:wide_table))
  end

  test "should destroy wide_table" do
    assert_difference('WideTable.count', -1) do
      delete :destroy, :id => @wide_table.to_param
    end

    assert_redirected_to wide_tables_path
  end
end
