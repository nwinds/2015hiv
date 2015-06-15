require 'rqrcode'
# require "rqrcode_png"
# require "rqrcode/"
class QrcoderController < ApplicationController
  before_action :set_wishlist, only: [:index, :encode, :decode]
  def index
  end

  def encode
  	@qrcode = RQRCode::QRCode.new(params[:product_id])
  	@qrcode_img = @qrcode.as_png
  	respond_to do |format|
  		format.html  		
  	end 
  end

  def decode
  # 	@product = Product.find(params[:product_id])
  # 	@file = File.open(@product.avatar.current_path)
		# # @file = File.open('F:\Documentary\rorDev\rec\public\images\uploads\product\avatar\14')
		# if @file
		# 	@file.decode
  # 	# @qrcode = RQRCode::QRCode.new(params[:product_id])
  # 	# @qrcode_img = @qrcode.as_png
  # 	respond_to do |format|
  # 		format.html  		
  # 	end 
	 #  else
	 #  	respond_to do |format|
	 #  		format.html {redirect_to @product}
	 #  	end
	 #  end
  end
end
