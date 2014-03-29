class Partdayliofperson < ActiveRecord::Base  
	#attr_accessible :numero, :groupsofwork_id, :fecha, :aprobado, :workers_attributes

  	belongs_to :groupsofwork
  	has_many :workers, :dependent => :destroy
  	accepts_nested_attributes_for :workers, reject_if: proc { |attributes| attributes[:catalogofwork_id].blank? }, :allow_destroy => true  	
  	validates :numero, :presence => { :message => 'NUMERO PARTE, no puede estar vacio.' }
  	validates :numero, :numericality => { :only_integer => true, :message => 'NUMERO PARTE, tiene que ser un numero.'}
  	validates :numero, :uniqueness => { :message => 'NUMERO PARTE, ya esta siendo usado por otro.' }

  	validates :groupsofwork_id, :presence => { :message => 'GRUPO DE TRABAJO, no puede estar vacio.' }

  	validates :fecha, :presence => { :message => 'FECHA, no puede estar vacio.' }
  	
end
