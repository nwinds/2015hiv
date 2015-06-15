class CreateQrcodes < ActiveRecord::Migration
  def change
    create_table :qrcodes do |t|
      t.integer :product_id
      t.binary :qrcode_img

      t.timestamps null: false
    end
  end
end
