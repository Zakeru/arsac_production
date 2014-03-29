class CreateTareosfilas < ActiveRecord::Migration
  def change
    create_table :tareosrows do |t|
      t.integer :tareoscolumn_id
      t.string :item

      t.timestamps
    end
  end
end
