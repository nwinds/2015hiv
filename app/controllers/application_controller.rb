class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :authorize

  protect_from_forgery with: :exception

  Encoding.default_internal="UTF-8"

protected
    def set_wishlist
      @wishlist = current_wishlist
    end

    def authorize
    	# unless User.find_by_id(session[:user_id])
		# respond_to do |format|
			# if @comment.save
			# format.html { redirect_to login_url, notice: "Login please" }
			# format.json { render :show, status: :created, location: @product }
			# else
			# format.html { redirect_to @product, notice: 'Comment failed to create!' }
			# format.json { render json: @comment.errors, status: :unprocessable_entity }
			# end

    		# redirect_to login_url, :notice => "请先登录"
    			
    		# end
    	# end
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
