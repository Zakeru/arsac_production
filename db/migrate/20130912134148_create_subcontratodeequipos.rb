class CreateSubcontratodeequipos < ActiveRecord::Migration
  def change
    create_table :subcontractofequipments do |t|
      t.integer :supplier_id
      t.string :valorizacion
      t.string :adelanto
      t.string :adelanto_detalle
      t.string :condiciones_de_pago
      t.string :igv
      t.string :fondo_de_garantia

      t.timestamps
    end
  end
end
