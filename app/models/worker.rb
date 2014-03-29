class Worker < ActiveRecord::Base
  #attr_accessible :partdayliofperson_id, :catalogofwork_id, :catalogcategorywork_id, :itemsofcontrol_id, :normal, :normal_100, :normal_60, :total_horas, :front_id

  validates :catalogofwork_id, :presence => { :message => 'TRABAJADOR, no puede estar vacio.' }
  validates :front_id, :presence => { :message => 'FRENTE, no puede estar vacio.' }
  validates :itemsofcontrol_id, :presence => { :message => 'PARTIDA DE CONTROL, 	no puede estar vacio.' }

  validates :normal, :presence => { :message => 'HORAS NORMALES, no puede estar vacio.' }
  validates :normal, :numericality => {:greater_than_or_equal_to => 0, :message => 'HORAS NORMALES, tiene que ser un numero o decimal.'}

  
  validates :total_horas, :presence => { :message => 'TOTAL DE HORAS, no puede estar vacio.' }
  validates :total_horas, :numericality => { :greater_than_or_equal_to => 0, :message => 'TOTAL DE HORAS, tiene que ser numero o decimal' }
  
  belongs_to :partdayliofperson
  belongs_to :catalogofwork
  belongs_to :catalogcategorywork
  belongs_to :itemsofcontrol
  belongs_to :front
end
