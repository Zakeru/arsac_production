class CreateReportedemaquinarias < ActiveRecord::Migration
  def change
    create_table :reportofmachineries do |t|
      t.string :nombre_subcontrato
      t.integer :subcontractofequipment_id
      t.date :inicio
      t.date :fin
      t.string :aprobado
      t.string :numero_de_valoriacion

      t.string :monto_contratado
      t.string :adelanto
      t.string :amortizacion_acumulada
      t.string :saldo

      t.string :valorizacion_cantidad
      t.string :valorizacion_acumulado_anterior
      t.string :valorizacion_acumulado_actual

      t.string :amortizacion_adelanto_porcentaje
      t.string :amortizacion_adelanto_cantidad
      t.string :amortizacion_adelanto_acumulado_anterior
      t.string :amortizacion_adelanto_acumulado_actual

      t.string :total_facturar_cantidad
      t.string :total_facturar_acumulado_anterior
      t.string :total_facturar_acumulado_actual

      t.string :igv_total_facturar_porcentaje
      t.string :igv_total_facturar_cantidad
      t.string :igv_total_facturar_acumulado_anterior
      t.string :igv_total_facturar_acumulado_actual

      t.string :total_incluido_igv_cantidad
      t.string :total_incluido_igv_acumulado_anterior
      t.string :total_incluido_igv_acumulado_actual

      t.string :detraccion_total_porcentaje
      t.string :detraccion_total_cantidad
      t.string :detraccion_total_acumulado_anterior
      t.string :detraccion_total_acumulado_actual

      t.string :descuento_combustible_cantidad
      t.string :descuento_combustible_acumulado_anterior
      t.string :descuento_combustible_acumulado_actual

      t.string :descuento_otros_cantidad
      t.string :descuento_otros_acumulado_anterior
      t.string :descuento_otros_acumulado_actual

      t.string :total_retenciones_cantidad
      t.string :total_retenciones_acumulado_anterior
      t.string :total_retenciones_acumulado_actual

      t.string :neto_pagar_cantidad
      t.string :neto_pagar_acumulado_anterior
      t.string :neto_pagar_acumulado_actual

      t.timestamps
    end
  end
end
