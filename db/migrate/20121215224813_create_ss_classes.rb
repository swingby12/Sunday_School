class CreateSsClasses < ActiveRecord::Migration
  def change
    create_table :ss_classes do |t|
      t.date :year
      t.integer :quarter
      t.string :name
      t.integer :book_id
      t.string :type

      t.timestamps
    end
  end
end
