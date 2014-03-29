class Chiefoffront < ActiveRecord::Base
  #attr_accessible :entity_id, :telefono, :movil_1, :movil_2, :mail, :direccion_1, :direccion_2, :foto, :nacimiento, :estado, :descripcion 
  belongs_to :entity
  has_many :groupsofworks
  validates_presence_of :entity_id, :message => 'en blanco'
end
