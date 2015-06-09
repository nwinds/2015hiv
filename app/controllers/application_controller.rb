class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  Encoding.default_internal="UTF-8"

protected
    def set_wishlist
      @wishlist = current_wishlist
    end
private

	# to find a wishlist if exists, otherwise, create one
	def current_wishlist
		Wishlist.find(session[:wishlist_id])
	rescue ActiveRecord::RecordNotFound
		wishlist = Wishlist.create
		session[:wishlist_id] = wishlist.id
		wishlist	
	end
end
