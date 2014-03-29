class CreateTareos < ActiveRecord::Migration
  def change
    create_table :tareos do |t|
      t.date :inicio
      t.date :fin
      t.integer :aprobado      

      t.timestamps
    end
  end
end
