require 'test_helper'

class QrcoderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get encode" do
    get :encode
    assert_response :success
  end

  test "should get decode" do
    get :decode
    assert_response :success
  end

end
