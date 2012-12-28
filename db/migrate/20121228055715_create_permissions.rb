class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.integer :category
      t.boolean :can_write
      t.boolean :can_create
      t.integer :user_id

      t.timestamps
    end
  end
end
