class CreateCatalogodetrabajadores < ActiveRecord::Migration
  def change
    create_table :catalogofworks do |t|
      t.integer :entity_id      
      t.string :telefono
      t.string :movil
      t.string :direccion
      t.string :mail
      t.string :numero_cuenta
      t.string :banco
      t.date :fecha_nacimiento  

      t.timestamps
    end    
    add_index :catalogofworks, :entity_id    
  end
end
