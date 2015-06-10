require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    @line_item = line_items(:one)
    @update = line_items(:two)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_item" do
    product = products(:ruby)
    assert_difference('LineItem.count') do
      post :create, :product_id => product
    end

    assert_redirected_to products_url
  end

  test "should show line_item" do
    get :show, id: @line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_item, line_item: @update.to_param, product_id: @update.product_id.to_param
    assert_response :success
  end

  test "should update line_item" do
    patch :update, id: @line_item, line_item: @update.to_param, product_id: @update.product_id.to_param, wishlist_id: @update.wishlist_id.to_param
    assert_redirected_to line_item_path(assigns(:line_item))
  end

  test "should destroy line_item" do
    # test case is not good, line_item with the product id does not exists
    assert_difference('LineItem.count', -1) do
      delete :destroy, id: @line_item, product_id: @line_item.product_id.to_param, wishlist_id: @line_item.wishlist_id
    end

    assert_redirected_to products_url
  end
end
