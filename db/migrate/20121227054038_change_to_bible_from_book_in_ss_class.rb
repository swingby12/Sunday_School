class ChangeToBibleFromBookInSsClass < ActiveRecord::Migration
  def up
    add_column :ss_classes, :bible_id, :integer
    remove_column :ss_classes, :book_id
  end

  def down
    add_column :ss_classes, :book_id, :integer
    remove_column :ss_classes, :bible_id
  end
end
