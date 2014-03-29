class Equipmentsofsubcontract < ActiveRecord::Base
  #attr_accessible :anho, :cantidad_h_m, :codigo, :descripcion, :horas_minimas, :equipmentincluded_id, :inputofequipment_id, :marca, :modelo, :precion_sin_igv, :serie, :subcontractofequipment_id, :unit_id, :fecha, :cantidad_contratada
  belongs_to :subcontractofequipment  
  belongs_to :equipmentincluded
  belongs_to :unit
  belongs_to :inputofequipment
  has_many :partofequipments
  has_many :vequipments


 
  validates_presence_of :codigo, message: 'codigo en blanco'
  validates_presence_of :inputofequipment_id, message: 'insumo de equipo en blanco'
  validates_presence_of :descripcion, message: 'descripcion en blanco'
  validates_presence_of :marca, message: 'marca en blanco'
  validates_presence_of :serie, message: 'serie en blanco'
  validates_presence_of :modelo, message: 'modelo en blanco'
  validates_presence_of :unit_id, message: 'unidad en blanco'
  validates_presence_of :equipmentincluded_id, message: 'equipo incluido en blanco'
  validates_presence_of :cantidad_h_m, message: 'cantidad en blanco'
  validates_presence_of :fecha, message: 'fecha en blanco'
  validates_presence_of :cantidad_contratada, message: 'cantidad en blanco'

end
