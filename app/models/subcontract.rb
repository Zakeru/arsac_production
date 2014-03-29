class Subcontract < ActiveRecord::Base
  #attr_accessible :adelanto, :adelanto_detalle, :condiciones_de_pago, :fondo_de_garantia, :igv, :valorizacion, :supplier_id, :amortizacion_porcentaje, :amortizacion_numero, :fondo_garantia_porcentaje, :detraccion_total_inicial_porcentaje, :monto_contratado, :adelanto1, :adelanto2, :adelanto3, :adelanto4, :fecha1, :fecha2, :fecha3, :fecha4, :inputs_attributes
  
  belongs_to :supplier
  has_many :inputs, :dependent => :destroy
  has_many :partworks
  has_many :partdayliofpeople
  has_many :groupsofworks
  
  accepts_nested_attributes_for :inputs, reject_if: proc { |attributes| attributes[:list_id].blank? }, :allow_destroy => true    
  #accepts_nested_attributes_for :inputs

  #validates_presence_of :supplier_id, :message => "Esta en Blanco"  
  #validates_presence_of :igv, :message => "Esta en Blanco"
  #validates_presence_of :fondo_garantia_porcentaje, :message => 'en blanco'
  #validates_presence_of :detraccion_total_inicial_porcentaje, :message => "Esta en Blanco"
end
