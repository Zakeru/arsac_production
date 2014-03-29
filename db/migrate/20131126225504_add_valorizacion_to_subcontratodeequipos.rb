class AddValorizacionToSubcontratodeequipos < ActiveRecord::Migration
  def change
    add_column :subcontractofequipments, :amortizacion_inicial_numero, :string
    add_column :subcontractofequipments, :amortizacion_inicial_porcentaje, :string
    add_column :subcontractofequipments, :fondo_de_garantia_porcentaje, :string
    add_column :subcontractofequipments, :detraccion_porcentaje, :string
    add_column :subcontractofequipments, :adelanto_1_numero, :string
    add_column :subcontractofequipments, :adelanto_1_fecha, :date
    add_column :subcontractofequipments, :adelanto_2_numero, :string
    add_column :subcontractofequipments, :adelanto_2_fecha, :date
    add_column :subcontractofequipments, :adelanto_3_numero, :string
    add_column :subcontractofequipments, :adelanto_3_fecha, :date
    add_column :subcontractofequipments, :adelanto_4_numero, :string
    add_column :subcontractofequipments, :adelanto_4_fecha, :date
    add_column :subcontractofequipments, :monto_contratado_suma, :string
  end
end
