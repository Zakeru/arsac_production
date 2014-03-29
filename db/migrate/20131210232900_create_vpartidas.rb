class CreateVpartidas < ActiveRecord::Migration
  def change
    create_table :vitems do |t|
      t.integer :valorizacione_id
      t.string :codigo
      t.string :partida_nombre
      t.string :unidad
      t.string :cantidad
      t.string :precio_unitario
      t.string :parcial

      t.timestamps
    end
  end
end
