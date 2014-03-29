class Catalogofwork < ActiveRecord::Base
  #attr_accessible :entity_id, :telefono, :movil, :direccion, :mail, :numero_cuenta, :banco, :fecha_nacimiento, :catalogcategorywork_id 
  belongs_to :entity
  belongs_to :partequipment
  belongs_to :catalogcategorywork
  has_many :workers
end
