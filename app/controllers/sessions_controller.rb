class SessionsController < ApplicationController
  skip_before_filter :authorize

  before_action :set_wishlist, only: [:new, :index, :destroy]
  def new
  end

  def create
    user = User.find_by(name: params[:name])
    if user and User.authenticate(params[:name], params[:password])
    	# if user = User.authenicate(params[:name], params[:password])
  		session[:user_id] = user.id
  		redirect_to admin_url
  	else

  		redirect_to login_url, :alert => "Invalid user/password combination"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, :notice => "Logged out"
  end
end
