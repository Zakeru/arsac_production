class Valuation < ActiveRecord::Base
  #attr_accessible :fecha_inicial, :fecha_fin, :subcontratista_nombre, :monto_contratado, :adelantos, :amortizacion_acumulada, :saldo_por_amortizar, :fondo_de_garantia_acumulada, :actual_valorizacion_actual, :acumulado_anterior_valorizacion_actual, :acumulado_actual_valorizacion_actual, :actual_amortizacion_porcentaje, :actual_amortizacion_numero, :acumulado_anterior_amortizacion_numero, :acumulado_actual_amortizacion_numero, :actual_total, :acumulado_anterior_total, :acumulado_actual_total, :actual_igv_porcentaje, :actual_igv_numero, :acumulado_anterior_igv_numero, :acumulado_actual_igv_numero, :actual_total_incluido_igv, :acumulado_anterior_total_incluido_igv, :acumulado_actual_total_incluido_igv, :actual_retenciones, :acumulado_anterior_retenciones, :acumulado_actual_retenciones, :actual_detraccion_del_total_porcentaje, :actual_detraccion_del_total_numero, :acumulado_anterior_detraccion_del_total_numero, :acumulado_actual_detraccion_del_total_numero, :actual_fondo_garantia_uno_porcentaje, :actual_fondo_garantia_uno_numero, :acumulado_anterior_fondo_garantia_uno_numero, :acumulado_actual_fondo_garantia_uno_numero, :actual_fondo_garantia_dos, :acumulado_anterior_fondo_garantia_dos, :acumulado_actual_fondo_garantia_dos, :actual_descuento_de_equipos, :acumulado_anterior_descuento_de_equipos, :acumulado_actual_descuento_de_equipos, :actual_descuento_de_materiales, :acumulado_anterior_descuento_de_materiales, :acumulado_actual_descuento_de_materiales, :actual_neto_pagar, :acumulado_anterior_neto_pagar, :acumulado_actual_neto_pagar, :valorizacione_subcontrato_id, :valorizacione_contador, :valorizacione_aprobado, :vmanodeobras_attributes, :vequipos_attributes, :actual_descuento_otros, :acumulado_anterior_descuento_otros, :acumulado_actual_descuento_otros, :subcontract_id, :vitems_attributes

  has_many :vitems, :dependent => :destroy
  has_many :vservices, :dependent => :destroy
  has_many :vequipments, :dependent => :destroy
  
  
  accepts_nested_attributes_for :vservices, reject_if: proc { |attributes| attributes[:nombre].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :vequipments, reject_if: proc { |attributes| attributes[:nombre].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :vitems, reject_if: proc { |attributes| attributes[:codigo].blank? }, :allow_destroy => true
  
end