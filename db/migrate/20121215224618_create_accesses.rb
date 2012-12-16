class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.integer :type
      t.boolean :write
      t.boolean :create
      t.integer :user_id

      t.timestamps
    end
  end
end
