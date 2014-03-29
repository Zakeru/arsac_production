class Sector < ActiveRecord::Base
  #attr_accessible :codigo, :descripcion
  has_many :subsectors  
  has_many :groupsofworks   

  validates_presence_of :codigo, :message => ": Esta en Blanco"
end
