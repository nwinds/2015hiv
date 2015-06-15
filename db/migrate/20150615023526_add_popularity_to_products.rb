class AddPopularityToProducts < ActiveRecord::Migration
  def change
    add_column :products, :popularity, :int
  end
end
