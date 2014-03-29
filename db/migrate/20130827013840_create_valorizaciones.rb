class CreateValorizaciones < ActiveRecord::Migration
  def change
    create_table :valuations do |t|
		t.date :fecha_inicial
		t.date :fecha_fin
		t.string :subcontratista_nombre
		t.integer :subcontract_id
		t.string :monto_contratado
		t.string :adelantos
		t.string :amortizacion_acumulada
		t.string :saldo_por_amortizar
		t.string :fondo_de_garantia_acumulada
		t.string :actual_valorizacion_actual
		t.string :acumulado_anterior_valorizacion_actual
		t.string :acumulado_actual_valorizacion_actual
		t.string :actual_amortizacion_porcentaje
		t.string :actual_amortizacion_numero
		t.string :acumulado_anterior_amortizacion_numero
		t.string :acumulado_actual_amortizacion_numero
		t.string :actual_total
		t.string :acumulado_anterior_total
		t.string :acumulado_actual_total
		t.string :actual_igv_porcentaje
		t.string :actual_igv_numero
		t.string :acumulado_anterior_igv_numero
		t.string :acumulado_actual_igv_numero
		t.string :actual_total_incluido_igv
		t.string :acumulado_anterior_total_incluido_igv
		t.string :acumulado_actual_total_incluido_igv
		t.string :actual_retenciones
		t.string :acumulado_anterior_retenciones
		t.string :acumulado_actual_retenciones
		t.string :actual_detraccion_del_total_porcentaje
		t.string :actual_detraccion_del_total_numero
		t.string :acumulado_anterior_detraccion_del_total_numero
		t.string :acumulado_actual_detraccion_del_total_numero
		t.string :actual_fondo_garantia_uno_porcentaje
		t.string :actual_fondo_garantia_uno_numero
		t.string :acumulado_anterior_fondo_garantia_uno_numero
		t.string :acumulado_actual_fondo_garantia_uno_numero
		t.string :actual_fondo_garantia_dos
		t.string :acumulado_anterior_fondo_garantia_dos
		t.string :acumulado_actual_fondo_garantia_dos
		t.string :actual_descuento_de_equipos
		t.string :acumulado_anterior_descuento_de_equipos
		t.string :acumulado_actual_descuento_de_equipos
		t.string :actual_descuento_de_materiales
		t.string :acumulado_anterior_descuento_de_materiales
		t.string :acumulado_actual_descuento_de_materiales		
		t.string :actual_neto_pagar
		t.string :acumulado_anterior_neto_pagar
		t.string :acumulado_actual_neto_pagar
		t.integer :valorizacione_subcontrato_id
		t.integer :valorizacione_contador
		t.integer :valorizacione_aprobado
		t.string :actual_descuento_otros
		t.string :acumulado_anterior_descuento_otros
		t.string :acumulado_actual_descuento_otros
      	t.timestamps
    end
  end
end
