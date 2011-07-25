class Proyecto < ActiveRecord::Base
  has_many :userstory
  has_many :usuario

  validates_presence_of :nombre,
                        :duracion_sprint,
                        :fecha_comienzo,
                        :fecha_entrega
  validates_length_of :nombre, :within => 3..40
  validates_numericality_of :duracion_sprint,
    :only_integer => true,
    :less_than_or_equal_to => 4, :greater_than_or_equal_to => 1,
    :message => "debe ser un nro entre 1 y 4"

  def after_initialize 
   self.duracion_sprint ||= 2
   self.fecha_comienzo ||= DateTime.now
   self.fecha_entrega ||= DateTime.now + 180
  end
end
