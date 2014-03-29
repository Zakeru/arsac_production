class Vmanodeobra < ActiveRecord::Base
  #attr_accessible :cantidad, :nombre, :parcial, :precio_unitario, :unidad, :valorizacione_id
  belongs_to :valorizacione  
end
