class CreatePartedeequipos < ActiveRecord::Migration
  def change
    create_table :partofequipments do |t|
      t.integer :subcontractofequipment_id
      t.integer :equipmentsofsubcontract_id
      t.string :numero
      t.string :fecha

      t.timestamps
    end
    add_index :partofequipments, :subcontractofequipment_id
    add_index :partofequipments, :equipmentsofsubcontract_id
  end
end
