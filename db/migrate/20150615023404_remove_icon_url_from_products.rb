class RemoveIconUrlFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :icon_url, :string
  end
end
