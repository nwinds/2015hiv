class AddProductIdToFileManagers < ActiveRecord::Migration
  def change
    add_column :file_managers, :product_id, :integer
  end
end
