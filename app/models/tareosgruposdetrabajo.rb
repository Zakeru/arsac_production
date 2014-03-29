class Tareosgruposdetrabajo < ActiveRecord::Base
  #attr_accessible :nombre, :tareo_id, :tareoscolumnas_attributes
  has_many :tareoscolumnas, :dependent => :destroy
  belongs_to :tareo

  accepts_nested_attributes_for :tareoscolumnas, reject_if: proc { |attributes| attributes[:item].blank? }, :allow_destroy => true
end
