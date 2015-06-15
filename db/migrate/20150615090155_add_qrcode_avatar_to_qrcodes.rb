class AddQrcodeAvatarToQrcodes < ActiveRecord::Migration
  def self.up
    add_column :qrcodes, :qrcode_avatar, :string
  end
  def self.down
  	remove_column :qrcodes, :qrcode_avatar, :string  	
  end
end
