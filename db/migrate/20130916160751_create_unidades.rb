class CreateUnidades < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.string :nombre
      t.string :descripcion

      t.timestamps
    end
  end
end
