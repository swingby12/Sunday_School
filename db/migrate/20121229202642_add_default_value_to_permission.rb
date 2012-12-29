class AddDefaultValueToPermission < ActiveRecord::Migration
  def change
    change_column :permissions, :can_read, :boolean, :default => false, :null => false
    change_column :permissions, :can_write, :boolean, :default => false, :null => false
  end
end
