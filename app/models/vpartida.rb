class Vpartida < ActiveRecord::Base
  #attr_accessible :cantidad, :codigo, :parcial, :partida_nombre, :precio_unitario, :unidad, :valorizacione_id
  belongs_to :valorizacione
end
