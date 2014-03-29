class Catalogcategorywork < ActiveRecord::Base
  #attr_accessible :nombre, :unit_id, :precio_unitario_normal, :precio_unitario_60, :precio_unitario_100
  has_many :workers
  has_many :catalogofworks
  belongs_to :unit

  validates :nombre, :presence => {:message => 'NOMBRE, no puede estar vacio.'}
  validates :unit_id, :presence => {:message => 'UNIDAD, no puede estar vacia.'}
  validates :precio_unitario_normal, :presence => {:message => 'PRECIO NORMAL, no puede estar vacio.'}
  validates :precio_unitario_60, :presence => {:message => 'PRECIO 60, no puede estar vacio.'}
  validates :precio_unitario_100, :presence => {:message => 'PRECIO 100, no puede estar vacio.'}
end
