class Front < ActiveRecord::Base
  #attr_accessible :descripcion, :nombre
  has_many :chiefoffronts
  has_many :partworks
  has_many :workers
  has_many :equipmentregisters
  has_many :voucherofmeals
  validates_presence_of :descripcion, :message => 'en blanco'  
  validates_presence_of :nombre, :message => 'en blanco'
end
