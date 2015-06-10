require 'test_helper'

class LineItemsControllerTest < ActionController::TestCase
  setup do
    # unquote this line to prepare data, (surely every tests here will report error), so that the data in the .yml will be put into the test database
    # then quote this line, rerun the test
    # prepare_data_for_wishlist()
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
    # use a stupid 1:run 2:quote way to prepare data
    # Product.where(:product_id => 4).destroy
    # Product.new(products(:LineItemProduct_four))
    product = products(:LineItemProduct_four)
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
    assert_redirected_to wishlist_path(@line_item.wishlist)
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

private
  # data preparation: for the very three:
  #   test between products, line_items, wishlist
  def prepare_data_for_wishlist()
    LineItem.new(line_items(:one))
    LineItem.new(line_items(:two))
    LineItem.new(line_items(:three))
    LineItem.new(line_items(:four))
    LineItem.new(line_items(:five))
    LineItem.new(line_items(:six))
  end




end

