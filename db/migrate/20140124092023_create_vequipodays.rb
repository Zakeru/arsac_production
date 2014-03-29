class CreateVequipodays < ActiveRecord::Migration
  def change
    create_table :vequipmentdays do |t|
      t.string :numero_parte
      t.string :fecha
      t.string :hora_inicio
      t.string :hora_fin
      t.string :horas_horas
      t.string :horas_efectivas
      t.string :suministro
      t.string :combustible
      t.integer :vequipment_id

      t.timestamps
    end
    add_index :vequipmentdays, :vequipment_id
  end
end
