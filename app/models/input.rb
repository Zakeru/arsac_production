class Input < ActiveRecord::Base
  #attr_accessible :subcontract_id, :cantidad, :list_id, :descripcion, :parcial, :pu_sin_igv, :unit_id
  belongs_to :subcontract
  belongs_to :list
  belongs_to :unit
  #validates_presence_of :unit_id, :message => ": Esta en Blanco"
  #validates_presence_of :cantidad, :message => ": Esta en Blanco"
  #validates_presence_of :pu_sin_igv, :message => ": Esta en Blanco"
end
