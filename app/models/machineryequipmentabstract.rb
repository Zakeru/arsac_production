class Machineryequipmentabstract < ActiveRecord::Base
  #attr_accessible :reportofmachinery_id, :equipmentofsubcontract_id, :nombre_equipo, :unidad, :precio_unitario, :acumulado_anterior_metrado, :acumulado_anterior_monto, :presente_valorizacion_metrado, :presente_valorizacion_monto, :acumulado_actual_metrado, :acumulado_actual_monto, :inicio, :fin, :machineryequipmentdetails_attributes
  has_many :machineryequipmentdetails, :dependent => :destroy
  belongs_to :reportofmachinery
  accepts_nested_attributes_for :machineryequipmentdetails, :allow_destroy => true
end
