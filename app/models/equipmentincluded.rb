class Equipmentincluded < ActiveRecord::Base
  #attr_accessible :nombre
  has_many :equipmentsofsubcontracts
end
