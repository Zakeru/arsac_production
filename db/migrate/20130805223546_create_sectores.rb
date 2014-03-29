class CreateSectores < ActiveRecord::Migration
  def change
    create_table :sectors do |t|
      t.string :codigo
      t.string :descripcion

      t.timestamps
    end
  end
end
