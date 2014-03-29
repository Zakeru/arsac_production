class Subcontractofequipment < ActiveRecord::Base
  #attr_accessible :adelanto, :adelanto_detalle, :condiciones_de_pago, :fondo_de_garantia, :igv, :supplier_id, :valorizacion, :amortizacion_inicial_numero, :amortizacion_inicial_porcentaje, :fondo_de_garantia_porcentaje, :detraccion_porcentaje, :adelanto_1_numero, :adelanto_1_fecha, :adelanto_2_numero, :adelanto_2_fecha, :adelanto_3_numero, :adelanto_3_fecha, :adelanto_4_numero, :adelanto_4_fecha, :monto_contratado_suma, :cantidad_contratada #, :equiposdesubcontratos_attributes


  has_many :partofequipments
  belongs_to :supplier
  has_many :equipmentsofsubcontracts, :dependent => :destroy

  #accepts_nested_attributes_for :equiposdesubcontratos, reject_if: proc { |attributes| attributes[:codigo].blank? }, :allow_destroy => true

  
  validates_presence_of :condiciones_de_pago, message: 'CONDICIONES DE PAGO, no puede estar en blanco.'
  #validates_presence_of :fondo_de_garantia, message: 'FONDO DE GARANTIA, no puede estar en blanco'
  validates_presence_of :igv, message: 'IGV, no puede estar en blanco.'
  validates_presence_of :supplier_id, message: 'PROVEEDOR, no puede estar en blanco.'
  validates_presence_of :valorizacion, message: 'VALORIZACION, no puede estar en blanco.'
  #validates_presence_of :amortizacion_inicial_numero, message: 'en blanco'
  #validates_presence_of :amortizacion_inicial_porcentaje, message: 'en blanco'
  validates_presence_of :fondo_de_garantia_porcentaje, message: ' FONDO DE GARANTIA PORCENTAJE, no puede estar en blanco.'
  validates_presence_of :detraccion_porcentaje, message: 'DETRACCION PORCENTAJE, no puede estar en blanco.'
  #validates_presence_of :adelanto_1_numero, message: 'en blanco'
  #validates_presence_of :adelanto_1_fecha, message: 'en blanco'
  #validates_presence_of :adelanto_2_numero, message: 'en blanco'
  #validates_presence_of :adelanto_2_fecha, message: 'en blanco'
  #validates_presence_of :adelanto_3_numero, message: 'en blanco'
  #validates_presence_of :adelanto_3_fecha, message: 'en blanco' 
  #validates_presence_of :adelanto_4_numero, message: 'en blanco'
  #validates_presence_of :adelanto_4_fecha, message: 'en blanco'
  #validates_presence_of :monto_contratado_suma, message: 'en blanco'  
end

