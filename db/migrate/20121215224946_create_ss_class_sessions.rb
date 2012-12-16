class CreateSsClassSessions < ActiveRecord::Migration
  def change
    create_table :ss_class_sessions do |t|
      t.integer :class_id
      t.date :date
      t.integer :instructor_id

      t.timestamps
    end
  end
end
