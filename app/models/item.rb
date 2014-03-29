class Item < ActiveRecord::Base
  #attr_accessible :list_id, :diametro, :terreno, :metrado, :observacion, :partwork_id, :profundidad, :serieclase, :unit_id
  belongs_to :partwork
  belongs_to :list
  belongs_to :unit

  validates_presence_of :list_id, message: 'PARTIDA, no puede estar en blanco.'
  validates_presence_of :unit_id, message: 'UNIDAD, no puede estar en blanco.'
  validates_presence_of :metrado, message: 'METRADO, no puede estar en blanco.'  
end
