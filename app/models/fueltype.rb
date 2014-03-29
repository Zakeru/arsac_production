class Fueltype < ActiveRecord::Base
  #attr_accessible :combustible, :tipo, :precio
  has_many :partedeequipos

  validates_presence_of :combustible
  validates_presence_of :tipo
  validates_presence_of :precio
end
