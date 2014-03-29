class Inputofequipment < ActiveRecord::Base
  #attr_accessible :cantidad, :codigo_tobi, :nombre, :precio, :unit_id
  has_many :equipmentsofsubcontracts
  belongs_to :unit
end
