class CreateSsAttendances < ActiveRecord::Migration
  def change
    create_table :ss_attendances do |t|
      t.integer :user_id
      t.integer :session_id

      t.timestamps
    end
  end
end
