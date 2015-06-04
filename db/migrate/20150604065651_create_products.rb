class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :detail
      t.string :icon_url
      t.decimal :price

      t.timestamps null: false
    end
  end
end
