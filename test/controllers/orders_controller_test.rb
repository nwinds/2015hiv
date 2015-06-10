require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  # my addin test
  test "requires item in wishlist" do
    get :new
    assert_redirected_to products_url
    assert_equal flash[:notice], "You wishlist is empty."
  end
  # end of my addin test

  test "should get new" do
    # supposing there is always a model available
    wishlist = Wishlist.create
    session[:wishlist_id] = wishlist.id
    LineItem.create(:wishlist => wishlist, :product => products(:ruby))

    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { email: @order.email, name: @order.name }
    end

    assert_redirected_to store_path
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { email: @order.email, name: @order.name }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
