class CreateEquiposregistrados < ActiveRecord::Migration
  def change
    create_table :equipmentregisters do |t|
      t.integer :partofequipment_id
      t.integer :groupsofwork_id
      t.integer :itemsofcontrol_id
      t.integer :front_id
      t.string :inicio
      t.string :fin
      t.string :cantidad

      t.timestamps
    end
    add_index :equipmentregisters, :front_id
    add_index :equipmentregisters, :groupsofwork_id
    add_index :equipmentregisters, :itemsofcontrol_id
    add_index :equipmentregisters, :partofequipment_id
  end
end
