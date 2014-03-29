class Supplier < ActiveRecord::Base  
  #attr_accessible :entity_id, :nombre, :direccion, :telefono, :movil_1, :movil_2, :cuenta_corriente1, :cuenta_corriente2, :cuenta_corriente3, :cuenta_de_detraccion, :contacto, :ruc, :cci_1, :cci_2, :cci_3, :banco_1, :banco_2, :banco_3
  belongs_to :entity
  has_many :subcontracts
  has_many :subcontractofequipments
  has_many :valesdeconsumos
  #validates_presence_of :entity_id, :message => ": seleccione un ente"
end
