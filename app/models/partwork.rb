class Partwork < ActiveRecord::Base
  #attr_accessible :numero, :groupsofwork_id, :aprobado, :fecha, :front_id, :items_attributes
  has_many :items, :dependent => :destroy
  belongs_to :groupsofwork
  belongs_to :front
  accepts_nested_attributes_for :items, reject_if: proc { |attributes| attributes[:list_id].blank? }, :allow_destroy => true  
  validates :numero, :presence => {:message => "NUMERO PARTE, no puede estar en blanco."}
  validates :numero, :numericality => {:only_integer => true, :message => 'NUMERO PARTE, tiene que ser un numero.'}
  validates :numero, :uniqueness => {:message => 'NUMERO PARTE, ya esta siendo usado por otro.'}
  validates :groupsofwork_id, :presence => { :message => 'GRUPO DE TRABAJO, no puede estar en blanco.' }
  validates :fecha, :presence => { :message => "FECHA, no puede estar vacio." }
  validates :front_id, :presence => { :message => 'FRENTE, no puede estar en blanco.' }
end

