class RemovePopularityFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :popularity, :int
  end
end
