class FileManager < ActiveRecord::Base
	mount_uploader :file_avatar, AvatarUploader
	belongs_to :product
	validates :file_avatar, :presence => true
	validates :product_id, :presence => true




  # simple search by name
  # try to expant into multiple search on next roll
  def self.search(avatar)

  	zxing_str = ZXing.decode(avatar.current_path)
  	# product_id = Integer(zxing_str, 10) 
  	Product.find(zxing_str.to_i)
  end


end
