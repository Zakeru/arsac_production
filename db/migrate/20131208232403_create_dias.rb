class CreateDias < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :numero
      t.integer :typeofday_id
      t.string :nombre
      t.integer :week_id

      t.timestamps
    end
    add_index :days, :week_id
    add_index :days, :typeofday_id
  end
end
