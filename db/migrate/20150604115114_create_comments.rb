# coding: utf-8
class CreateComments < ActiveRecord::Migration
  def self.up
    if table_exists?(:comments)
      drop_table :comments 
    end
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :products
  end

  def self.down
  	drop_table :comments  	
  end
end
