class CreateReportedeequipos < ActiveRecord::Migration
  def change
    create_table :reportofequipments do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
