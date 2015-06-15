class SessionsController < ApplicationController
  before_action :set_wishlist, only: [:new, :index, :destroy]
  def new
  end

  def create
  	if user = User.authenicate(params[:name], params[:password])
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