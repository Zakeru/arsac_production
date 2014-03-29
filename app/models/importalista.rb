class Importalista < ActiveRecord::Base
  #attr_accessible :nombre, :listacategorias_attributes
  has_many :listacategorias, :dependent => :destroy
  accepts_nested_attributes_for :listacategorias, reject_if: proc { |attributes| attributes[:codigo].blank? }, :allow_destroy => true
end
