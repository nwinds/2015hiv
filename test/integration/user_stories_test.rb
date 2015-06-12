require 'test_helper'

class UserStoriesTest < ActionDispatch::IntegrationTest
	fixtures :product

	LineItem.delete_all
	Order.delete_all
	ruby_book = products(:three)



	# visit store index
	get '/'
	assert_response :success
	assert_template "index"



	# select a product and add it into wishlist
	# check while action return an reply
	xml_http_request :post, '/line_items', :product_id => ruby_book.id
	assert_response :success

	wishlist = Wishlist.find(session[:wishlist_id])
	assert_equal 1, wishlist.line_items.size
	assert_equal ruby_book, wishlist.line_items[0].product



	# get orders
	get "/orders/new"
	assert_response :success
	assert_template "new"



	# redirect to index, check wishlist is empty or not
	post_via_redirect "/orders",
					:order => {:name => "Tester Maker",
						:email => "tester@example.com"}
	assert_response :success
	assert_template "/products"
	wishlist = Wishlist.find(session[:wishlist])
	assert_equal 0, wishlist.line_items.size



	# ActiveRecord and database interaction
	orders = Order.all
	assert_equal 1, orders.size
	order = orders[0]

	assert_equal "Tester Maker", order.name
	assert_equal "tester@example", order.email

	assert_equal 1, order.line_items.size
	line_item = order.line_items[0]
	assert_equal ruby_book, line_item.product



	# check the mail: address and main line
	mail = ActionMailer::base.deliveries.last
	assert_equal ["toConfirm@example.com"], mail.to
	assert_equal 'To Confirm<xx@example.com>', mail[:from].value
	assert_equal "To confirm", mail.subject

  # test "the truth" do
  #   assert true
  # end
end
