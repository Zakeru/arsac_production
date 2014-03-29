class Unit < ActiveRecord::Base
  #attr_accessible :descripcion, :nombre
  has_many :items
  has_many :equiposdesubcontratos
  has_many :insumos
  has_many :insumodeequipos
  has_many :equiposregistrados
  has_many :catalogocategoriatrabajadores
  has_many :lists
  validates_presence_of :descripcion, :message => 'en blanco'
  validates_presence_of :nombre, :message => 'en blanco'
end
