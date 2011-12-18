require 'test_helper'

class SrcTablesControllerTest < ActionController::TestCase
  setup do
    @src_table = src_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:src_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create src_table" do
    assert_difference('SrcTable.count') do
      post :create, :src_table => @src_table.attributes
    end

    assert_redirected_to src_table_path(assigns(:src_table))
  end

  test "should show src_table" do
    get :show, :id => @src_table.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @src_table.to_param
    assert_response :success
  end

  test "should update src_table" do
    put :update, :id => @src_table.to_param, :src_table => @src_table.attributes
    assert_redirected_to src_table_path(assigns(:src_table))
  end

  test "should destroy src_table" do
    assert_difference('SrcTable.count', -1) do
      delete :destroy, :id => @src_table.to_param
    end

    assert_redirected_to src_tables_path
  end
end
