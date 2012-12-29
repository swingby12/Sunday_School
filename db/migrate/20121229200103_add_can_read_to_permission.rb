class AddCanReadToPermission < ActiveRecord::Migration
  def up
    add_column :permissions, :can_read, :boolean
    remove_column :permissions, :can_create
  end

  def down
    add_column :permissions, :can_create, :boolean
    remove_column :permissions, :can_read
  end
end
