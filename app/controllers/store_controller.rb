class StoreController < ApplicationController
  def index
  	@wishlist = current_wishlist
  end
end
