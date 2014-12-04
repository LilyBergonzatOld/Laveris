require 'test_helper'

class LaundromatsControllerTest < ActionController::TestCase
  setup do
    @laundromat = laundromats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laundromats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laundromat" do
    assert_difference('Laundromat.count') do
      post :create, laundromat: { capacity: @laundromat.capacity, libcity: @laundromat.libcity, libstreet: @laundromat.libstreet, name: @laundromat.name, nbstreet: @laundromat.nbstreet, phone: @laundromat.phone, zipcode: @laundromat.zipcode }
    end

    assert_redirected_to laundromat_path(assigns(:laundromat))
  end

  test "should show laundromat" do
    get :show, id: @laundromat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @laundromat
    assert_response :success
  end

  test "should update laundromat" do
    patch :update, id: @laundromat, laundromat: { capacity: @laundromat.capacity, libcity: @laundromat.libcity, libstreet: @laundromat.libstreet, name: @laundromat.name, nbstreet: @laundromat.nbstreet, phone: @laundromat.phone, zipcode: @laundromat.zipcode }
    assert_redirected_to laundromat_path(assigns(:laundromat))
  end

  test "should destroy laundromat" do
    assert_difference('Laundromat.count', -1) do
      delete :destroy, id: @laundromat
    end

    assert_redirected_to laundromats_path
  end
end
