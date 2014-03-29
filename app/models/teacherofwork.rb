class Teacherofwork < ActiveRecord::Base
  #attr_accessible :banco_1, :correo, :entity_id, :foto, :chiefoffront_id, :movil, :nacimiento, :ruc, :telefono    
  belongs_to :entity
  has_many :groupsofworks
  validates_presence_of :entity_id, :message => 'en blanco'
end
