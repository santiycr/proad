class Userstory < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :usuario
  has_many :tarea

  after_initialize :init


  validates_presence_of :proyecto
  validates_numericality_of :prioridad,
    :only_integer => true,
    :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1,
    :message => "debe ser un nro entre 1 y 5"
  validates_numericality_of :complejidad,
    :only_integer => true,
    :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1,
    :message => "debe ser un nro entre 1 y 5"

  def init
   self.complejidad ||= 3
   self.prioridad ||= 3
  end

end
