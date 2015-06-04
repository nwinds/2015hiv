# coding: utf-8
class CreateProducts < ActiveRecord::Migration
  def self.up
    if table_exists?(:products)
      drop_table :products
    end
    create_table :products do |t|
      t.string :name
      t.text :detail
      t.string :icon_url
      t.decimal :price, :precision => 8, :scale =>2

      t.timestamps null: false
    end
  end
  # drop everytime it start agian
  def self.down
  	drop_table :products
  end  	
end
