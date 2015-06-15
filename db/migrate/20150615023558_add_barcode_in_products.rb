class AddBarcodeInProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :barcode, :string
  end
  def self.down
  	remove_column :products, :barcode, :string  	
  end
end
