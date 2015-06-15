class AddQrcodeStrToQrcodes < ActiveRecord::Migration
  def change
    add_column :qrcodes, :qrcode_png, :binary
  end
end
