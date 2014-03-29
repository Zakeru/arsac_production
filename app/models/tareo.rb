class Tareo < ActiveRecord::Base
  #attr_accessible :inicio, :fin, :aprobado, :tareosgruposdetrabajos_attributes
  has_many :tareosgruposdetrabajos, :dependent => :destroy

  accepts_nested_attributes_for :tareosgruposdetrabajos, reject_if: proc { |attributes| attributes[:nombre].blank? }, :allow_destroy => true
end
