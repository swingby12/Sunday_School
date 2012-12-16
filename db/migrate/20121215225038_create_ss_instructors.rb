class CreateSsInstructors < ActiveRecord::Migration
  def change
    create_table :ss_instructors do |t|
      t.integer :user_id
      t.integer :class_id

      t.timestamps
    end
  end
end
