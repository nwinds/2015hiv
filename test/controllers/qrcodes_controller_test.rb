require 'test_helper'

class QrcodesControllerTest < ActionController::TestCase
  setup do
    @qrcode = qrcodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:qrcodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create qrcode" do
    assert_difference('Qrcode.count') do
      post :create, qrcode: { product_id: @qrcode.product_id, qrcode_img: @qrcode.qrcode_img }
    end

    assert_redirected_to qrcode_path(assigns(:qrcode))
  end

  test "should show qrcode" do
    get :show, id: @qrcode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @qrcode
    assert_response :success
  end

  test "should update qrcode" do
    patch :update, id: @qrcode, qrcode: { product_id: @qrcode.product_id, qrcode_img: @qrcode.qrcode_img }
    assert_redirected_to qrcode_path(assigns(:qrcode))
  end

  test "should destroy qrcode" do
    assert_difference('Qrcode.count', -1) do
      delete :destroy, id: @qrcode
    end

    assert_redirected_to qrcodes_path
  end
end