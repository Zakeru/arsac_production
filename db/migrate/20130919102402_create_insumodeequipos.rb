class CreateInsumodeequipos < ActiveRecord::Migration
  def change
    create_table :inputofequipments do |t|
      t.string :codigo_tobi
      t.string :nombre
      t.integer :unit_id
      t.string :cantidad
      t.string :precio

      t.timestamps
    end
    add_index :inputofequipments, :unit_id
  end
end
