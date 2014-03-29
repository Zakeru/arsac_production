class Itemsofcontrol < ActiveRecord::Base
  #attr_accessible :phase_id, :subphase_id, :subsector_id, :sector_id
  belongs_to :sector
  belongs_to :subsector
  belongs_to :phase
  belongs_to :subphase
  has_many :equipos
  has_many :trabajadore
  has_many :materiales
  has_many :equiposregistrados
  validates_presence_of :phase_id, :message => 'en blanco'
  validates_presence_of :subphase_id, :message => 'en blanco'
  validates_presence_of :subsector_id, :message => 'en blanco'
  validates_presence_of :sector_id, :message => 'en blanco'
end