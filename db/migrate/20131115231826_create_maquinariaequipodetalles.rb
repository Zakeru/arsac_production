class CreateMaquinariaequipodetalles < ActiveRecord::Migration
  def change
    create_table :machineryequipmentdetails do |t|
      
      t.integer :machineryequipmentabstract_id
      t.string :numero
      t.string :parte
      t.string :fecha
      t.string :horometro_inicio
      t.string :horometro_fin
      t.string :horometro_horas
      t.string :horas_efectivas
      t.string :suministro
      t.string :combustible

      t.timestamps
    end
    add_index :machineryequipmentdetails, :machineryequipmentabstract_id
  end
end
