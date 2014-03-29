class CreateEntes < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.string :razon_social      
      t.string :ruc

      t.timestamps
    end
  end
end
