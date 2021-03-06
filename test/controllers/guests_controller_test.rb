require 'test_helper'

class GuestsControllerTest < ActionController::TestCase
  setup do
    @guest = guests(:one)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guest" do
    assert_difference('Guest.count') do
      post :create, guest: { designation: @guest.designation, email: @guest.email, name: @guest.name, phone: @guest.phone }
    end

    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should get edit" do
    get :edit, id: @guest
    assert_response :success
  end

  test "should update guest" do
    patch :update, id: @guest, guest: { designation: @guest.designation, email: @guest.email, name: @guest.name, phone: @guest.phone }
    assert_redirected_to guest_path(assigns(:guest))
  end

  test "should destroy guest" do
    assert_difference('Guest.count', -1) do
      delete :destroy, id: @guest
    end

    assert_redirected_to guests_path
  end
end
