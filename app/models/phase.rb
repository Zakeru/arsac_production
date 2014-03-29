class Phase < ActiveRecord::Base
  #attr_accessible :codigo, :descripcion
  has_many :subphases
  has_many :partidasdecontrols
end
