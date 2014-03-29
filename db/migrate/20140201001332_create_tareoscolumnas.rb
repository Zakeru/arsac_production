class CreateTareoscolumnas < ActiveRecord::Migration
  def change
    create_table :tareoscolumns do |t|
      t.integer :tareosgroupsofwork_id
      t.string :item

      t.timestamps
    end
  end
end
