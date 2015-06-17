class StoreController < ApplicationController
	skip_before_filter :authorize
  def index
  	@wishlist = current_wishlist
  end
end
