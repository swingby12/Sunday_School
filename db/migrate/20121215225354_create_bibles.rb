class CreateBibles < ActiveRecord::Migration
  def change
    create_table :bibles do |t|
      t.string :name

      t.timestamps
    end
  end
end
