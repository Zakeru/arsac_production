class Maquinariaequipodetalle < ActiveRecord::Base
  #attr_accessible :combustible, :fecha, :horas_efectivas, :horometro_fin, :horometro_horas, :horometro_inicio, :maquinariaequipo_id, :numero, :parte, :suministro
  belongs_to :maquinariaequiporesumene
end
