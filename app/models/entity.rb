class Entity < ActiveRecord::Base 
  #attr_accessible :nombre, :ruc, :dni, :apellido
  has_many :chiefoffronts
  has_many :teacherofworks
  belongs_to :supplier
  has_many :catalogofworks

  validates :dni, :uniqueness => {:message => 'DNI, ya esta siendo usado por otro.'}, :allow_blank => true
  validates :ruc, :uniqueness => {:message => 'RUC, ya esta siendo usado por otro.'}, :allow_blank => true
  validates_length_of :nombre,:minimum => 3, :maximum => 50, :allow_blank => true, :message => 'NOMBRE, minimo 3 caracteres.'  
  validates_length_of :apellido,:minimum => 3, :maximum => 50, :allow_blank => true, :message => 'NOMBRE, minimo 3 caracteres.'
  ##validate :ruc_or_ente

  private
  
  def ruc_or_ente
  		if ruc.blank?  and dni.blank?
  			errors.add(:base, "RUC o DNI, no puede estar vacio los dos.")
  		end
  end

  

end
