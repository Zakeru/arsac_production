class List < ActiveRecord::Base
  #attr_accessible :codigo, :nombre, :unit_id, :precio_unitario, :listcategory_id
  belongs_to :listcategory
  has_many :partidas
  has_many :insumos
  belongs_to :unit
  
  #validates_presence_of :listacategoria_id, :message => 'En Blanco'
  #validates_presence_of :unidade_id, :message => 'En Blanco'
  #validates_presence_of :nombre, :message => 'en blanco'
  #validates_presence_of :precio_unitario, :message => 'En blanco'
  #validates_presence_of :codigo, :message => 'En blanco'
end
