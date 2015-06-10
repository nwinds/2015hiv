require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    # prepare_data()
    @product = products(:one)
    @update = {
      :name     => 'product_controller_test case',
      :detail   => 'test:functionalsproduct updated test case',
      :icon_url => 'todo.jpg',
      :price    => 10.02
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  # test "should get index" do
    # get :index
    # assert_response :success
    assert_select '#columns #side a', :minmun => 4    # test <a> in id = columns, id = side: all fitting in at least  4
    assert_select 'h3', 'product 1'
    assert_select '#main .list_description', :minmun => 2  # test there are three class named entry
    assert_select '#main .list_actions', 9  # test there are three class named entry
    # assert_select '.price', /\uFFE5[,\d]+\.\d\d/
  # end

  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    put :update, id: @product.to_param, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

private
  def prepare_data()
    Product.new(products(:one))
    Product.new(products(:two))
    Product.new(products(:three))
  end
end
