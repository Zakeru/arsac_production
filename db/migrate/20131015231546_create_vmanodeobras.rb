class CreateVmanodeobras < ActiveRecord::Migration
  def change
    create_table :vservices do |t|
      t.string :nombre
      t.string :cantidad
      t.string :unidad
      t.string :precio_unitario
      t.string :parcial
      t.integer :valuation_id

      t.timestamps
    end
  end
end
