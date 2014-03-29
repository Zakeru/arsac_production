class Listcategory < ActiveRecord::Base
  #attr_accessible :codigo, :nombre, :importlist_id, :lists_attributes

  has_many :lists, :dependent => :destroy  
  belongs_to :importlist
  
  accepts_nested_attributes_for :lists, :allow_destroy => true  
end
