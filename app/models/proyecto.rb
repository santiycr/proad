class Proyecto < ActiveRecord::Base
  has_many :userstory
  has_many :usuario

  validates_presence_of :nombre
  validates_length_of :nombre, :within => 3..40
end
