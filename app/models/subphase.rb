class Subphase < ActiveRecord::Base
  #attr_accessible :codigo, :descripcion, :phase_id
  belongs_to :phase
  has_many :partidasdecontrols
  validates_presence_of :codigo, :message => 'en blanco'
  validates_presence_of :descripcion,:message => 'en blanaco'
  validates_presence_of :phase_id, :message => 'en blanco'
end
