class Maquinariaequipo < ActiveRecord::Base

  #attr_accessible :nombre, :reportedemaquinaria_id, :maquinariaequiporesumenes_attributes, :maquinariaequipodetalles_attributes

  belongs_to :reportedemaquinaria

  has_many :maquinariaequiporesumenes, :dependent => :destroy

  has_many :maquinariaequipodetalles, :dependent => :destroy

  accepts_nested_attributes_for :maquinariaequiporesumenes, :allow_destroy => true

  accepts_nested_attributes_for :maquinariaequipodetalles, :allow_destroy => true

end
