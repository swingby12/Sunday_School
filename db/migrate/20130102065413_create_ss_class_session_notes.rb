class CreateSsClassSessionNotes < ActiveRecord::Migration
  def change
    create_table :ss_class_session_notes do |t|
      t.integer :ss_class_session_id
      t.timestamps
    end
    add_attachment :ss_class_session_notes, :file
  end
end
