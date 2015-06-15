class RemoveQrcodeImgFromQrcodes < ActiveRecord::Migration
  def change
    remove_column :qrcodes, :qrcode_avatar, :binary
  end
end
