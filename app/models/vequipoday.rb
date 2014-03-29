class Vequipoday < ActiveRecord::Base
  #attr_accessible :combustible, :fecha, :hora_fin, :hora_inicio, :horas_efectivas, :horas_horas, :numero_parte, :suministro
  belongs_to :vequipo
end
