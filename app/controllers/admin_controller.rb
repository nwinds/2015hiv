class AdminController < ApplicationController
	# this is a terrible bug: have to fix it later. may be should partialize products' model and use the template restricted to it
  before_action :set_wishlist, only: [:index]
  def index
  	@total_orders = Order.count
  	# todo: add in several other things later, but not *follow the book*
  end
end
