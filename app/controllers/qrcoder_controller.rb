require 'rqrcode'
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
  end
end
