class CreateVequipos < ActiveRecord::Migration
  def change
    create_table :vequipments do |t|
      t.string :nombre
      t.string :cantidad
      t.string :unidad
      t.string :precio_unitario
      t.string :parcial
      t.integer :valuation_id
      t.integer :equipmentsofsubcontract_id

      t.timestamps
    end
    add_index :vequipments, :equipmentsofsubcontract_id
  end
end
