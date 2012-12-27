class AddSsClassSessionIdToSsAttendance < ActiveRecord::Migration
  def up
    add_column :ss_attendances, :ss_class_session_id, :integer
    remove_column :ss_attendances, :session_id
  end

  def down
    add_column :ss_attendances, :session_id, :integer
    remove_column :ss_attendances, :ss_class_session_id
  end
end
