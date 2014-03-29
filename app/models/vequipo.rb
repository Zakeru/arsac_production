class Vequipo < ActiveRecord::Base
  #attr_accessible :cantidad, :nombre, :parcial, :precio_unitario, :unidad, :valorizacione_id, :equiposdesubcontrato_id, :vequipodays_attributes
  belongs_to :valorizacione
  belongs_to :equiposdesubcontrato
  has_many :vequipodays, :dependent => :destroy  
  accepts_nested_attributes_for :vequipodays, reject_if: proc { |attributes| attributes[:numero_parte].blank? }, :allow_destroy => true
end
