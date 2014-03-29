class CreateProveedores < ActiveRecord::Migration
  def change
    create_table :suppliers do |t|
      t.integer :entity_id
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :movil_1
      t.string :movil_2
      t.string :cuenta_corriente_1
      t.string :cuenta_corriente_2
      t.string :cuenta_corriente_3
      t.string :cuenta_de_detraccion
      t.string :contacto
      t.string :ruc
      t.string :cci_1
      t.string :cci_2
      t.string :cci_3
      t.string :banco_1
      t.string :banco_2
      t.string :banco_3
      
      t.timestamps
    end
  end
end
