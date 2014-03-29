class CreateSemanas < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.integer :numero
      t.integer :month_id

      t.timestamps
    end
    add_index :weeks, :month_id
  end
end
