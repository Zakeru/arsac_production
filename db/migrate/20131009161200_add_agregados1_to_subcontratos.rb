class AddAgregados1ToSubcontratos < ActiveRecord::Migration
  def change
    add_column :subcontracts, :amortizacion_porcentaje, :string
    add_column :subcontracts, :amortizacion_numero, :string
    add_column :subcontracts, :fondo_garantia_porcentaje, :string
    add_column :subcontracts, :detraccion_total_inicial_porcentaje, :string
    add_column :subcontracts, :monto_contratado, :string
    add_column :subcontracts, :adelanto1, :string
    add_column :subcontracts, :adelanto2, :string
    add_column :subcontracts, :adelanto3, :string
    add_column :subcontracts, :adelanto4, :string
    add_column :subcontracts, :fecha1, :date
    add_column :subcontracts, :fecha2, :date
    add_column :subcontracts, :fecha3, :date
    add_column :subcontracts, :fecha4, :date
  end
end
