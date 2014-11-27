require 'test_helper'

class LaveriesControllerTest < ActionController::TestCase
  setup do
    @lavery = laveries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lavery" do
    assert_difference('Laverie.count') do
      post :create, lavery: { cdpost: @lavery.cdpost, laverie_id: @lavery.laverie_id, librue: @lavery.librue, libville: @lavery.libville, name: @lavery.name, nbmaxpers: @lavery.nbmaxpers, numrue: @lavery.numrue, numtel: @lavery.numtel }
    end

    assert_redirected_to lavery_path(assigns(:lavery))
  end

  test "should show lavery" do
    get :show, id: @lavery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lavery
    assert_response :success
  end

  test "should update lavery" do
    patch :update, id: @lavery, lavery: { cdpost: @lavery.cdpost, laverie_id: @lavery.laverie_id, librue: @lavery.librue, libville: @lavery.libville, name: @lavery.name, nbmaxpers: @lavery.nbmaxpers, numrue: @lavery.numrue, numtel: @lavery.numtel }
    assert_redirected_to lavery_path(assigns(:lavery))
  end

  test "should destroy lavery" do
    assert_difference('Laverie.count', -1) do
      delete :destroy, id: @lavery
    end

    assert_redirected_to laveries_path
  end
end
