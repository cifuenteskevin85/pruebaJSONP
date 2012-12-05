class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :work
      t.boolean :check , :default => false
      t.timestamps
    end
  end
end
