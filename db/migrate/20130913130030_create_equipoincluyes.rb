class CreateEquipoincluyes < ActiveRecord::Migration
  def change
    create_table :equipmentincludeds do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
