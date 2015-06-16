class CreateFileManagers < ActiveRecord::Migration
  def change
    create_table :file_managers do |t|
      t.string :file_avatar

      t.timestamps null: false
    end
  end
end
