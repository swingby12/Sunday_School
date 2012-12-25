class ChangeYearInSsClass < ActiveRecord::Migration
  def up
    remove_column :ss_classes, :year
    add_column :ss_classes, :year, :integer

    remove_column :ss_classes, :type
    add_column :ss_classes, :category, :integer
  end

  def down
    remove_column :ss_classes, :year
    add_column :ss_classes, :year, :string

    add_column :ss_classes, :type, :string
    remove_column :ss_classes, :category
  end
end
