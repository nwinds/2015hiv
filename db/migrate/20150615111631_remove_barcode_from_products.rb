class RemoveBarcodeFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :barcode, :string
  end
end
