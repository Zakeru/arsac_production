class Groupsofwork < ActiveRecord::Base
  #attr_accessible :sector_id, :subsector_id, :chiefoffront_id, :subcontract_id, :teacherofwork_id, :activo
  belongs_to :sector
  belongs_to :subsector
  belongs_to :chiefoffront
  belongs_to :subcontract
  belongs_to :teacherofwork
  has_many :parteobras
  has_many :partediariodepersonals
  has_many :valesdeconsumos
  has_many :equiposregistrados

  validates_presence_of :sector_id, :message => " : Seleccione un Sector"
  validates_presence_of :subsector_id, :message => " : Seleccione un SubSector"  
  validates_presence_of :chiefoffront_id, :message => " : Seleccione un jefedefrente"
  validates_presence_of :subcontract_id, :message => " : Seleccione un Subcontratista"
  validates_presence_of :teacherofwork_id, :message => " : Seleccione un maestrodeobra"
  validates_presence_of :activo, :message => 'Seleccionar activo o inactivo'

end
