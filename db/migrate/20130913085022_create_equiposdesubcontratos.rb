class CreateEquiposdesubcontratos < ActiveRecord::Migration
  def change
    create_table :equipmentsofsubcontracts do |t|
      t.integer :subcontractofequipment_id
      t.string :codigo
      t.string :descripcion
      t.integer :inputofequipment_id
      t.string :marca
      t.string :serie
      t.string :modelo
      t.string :anho
      t.integer :unit_id
      t.string :precion_sin_igv
      t.integer :equipmentincluded_id
      t.string :horas_minimas
      t.string :cantidad_h_m

      t.timestamps
    end
    add_index :equipmentsofsubcontracts, :inputofequipment_id
  end
end
