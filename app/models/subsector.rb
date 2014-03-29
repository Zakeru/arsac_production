class Subsector < ActiveRecord::Base
  #attr_accessible :codigo, :descripcion, :sector_id  
  belongs_to :sector
  has_many :partidasdecontrols  
  has_many :groupsofworks  
  validates_presence_of :codigo, :message => "En blanco"
  validates_presence_of :descripcion, :message => 'En blanco'
  validates_presence_of :sector_id, :message => 'En Blanco'
end
