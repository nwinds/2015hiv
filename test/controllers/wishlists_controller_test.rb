require 'test_helper'

class WishlistsControllerTest < ActionController::TestCase
  setup do
    @wishlist = wishlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishlist" do
    assert_difference('Wishlist.count') do
      post :create, wishlist: {  }
    end

    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should show wishlist" do
    get :show, id: @wishlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wishlist
    assert_response :success
  end

  test "should update wishlist" do
    patch :update, id: @wishlist.to_param, wishlist: @wishlist
    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should destroy wishlist" do
    # wishlist shall only change session without really delete wishlist in ActiveView
    assert_difference('Wishlist.count', 0) do
      session[:wishlist] = @wishlist.id
      delete :destroy, id: @wishlist.to_param
    end

    # assert_difference(session[:wishlist], 0)
    assert_redirected_to products_path
  end
end
