class Tareoscolumna < ActiveRecord::Base
  #attr_accessible :item, :tareosgruposdetrabajo_id, :tareosfilas_attributes
  has_many :tareosfilas, :dependent => :destroy
  belongs_to :tareosgruposdetrabajo

  accepts_nested_attributes_for :tareosfilas, reject_if: proc { |attributes| attributes[:item].blank? }, :allow_destroy => true
end
