require 'test_helper'

class FileManagersControllerTest < ActionController::TestCase
  setup do
    @file_manager = file_managers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:file_managers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create file_manager" do
    assert_difference('FileManager.count') do
      post :create, file_manager: { file_avatar: @file_manager.file_avatar }
    end

    assert_redirected_to file_manager_path(assigns(:file_manager))
  end

  test "should show file_manager" do
    get :show, id: @file_manager
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @file_manager
    assert_response :success
  end

  test "should update file_manager" do
    patch :update, id: @file_manager, file_manager: { file_avatar: @file_manager.file_avatar }
    assert_redirected_to file_manager_path(assigns(:file_manager))
  end

  test "should destroy file_manager" do
    assert_difference('FileManager.count', -1) do
      delete :destroy, id: @file_manager
    end

    assert_redirected_to file_managers_path
  end
end
