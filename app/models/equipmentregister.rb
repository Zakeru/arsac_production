class Equipmentregister < ActiveRecord::Base
  #attr_accessible :cantidad, :groupsofwork_id, :fin, :inicio, :itemsofcontrol_id, :partofequipment_id, :front_id
  belongs_to :partofequipment
  belongs_to :groupsofwork
  belongs_to :itemsofcontrol
  belongs_to :front

  validates_presence_of :groupsofwork_id, :message => "GRUPODETRABAJO, no puede estar en blanco."
  validates_presence_of :itemsofcontrol_id, :message => 'PARTIDA DE CONTROL, no puede estar en blanco.'
  validates_presence_of :cantidad, :message => 'CANTIDAD, no puede estar en blanco.'
  validates_presence_of :front_id, :message => 'FRENTE, no puede estar en blanco.'
end
