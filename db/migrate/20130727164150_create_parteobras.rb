class CreateParteobras < ActiveRecord::Migration
  def change
    create_table :partworks do |t|
      t.string :numero
      t.date :fecha
      t.integer :groupsofwork_id

      t.timestamps
    end
       
    add_index :partworks, :groupsofwork_id
  end
end
