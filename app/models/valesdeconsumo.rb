class Valesdeconsumo < ActiveRecord::Base
  #attr_accessible :numero_vale, :gruposdetrabajo_id, :tipo_vale, :proveedore_id, :tipo_material, :cantidad, :fecha_de_ingreso, :frente_id  
  belongs_to :gruposdetrabajo
  belongs_to :proveedore
  belongs_to :frente

  validates_presence_of :numero_vale, :message => "en blanco"
  validates_presence_of :fecha_de_ingreso, :message => "en blanco"
  validates_presence_of :frente_id, :message => 'en blanco'
end
