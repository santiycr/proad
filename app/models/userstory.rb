class Userstory < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :usuario
  has_many :tarea

  after_initialize :init

  def self.completas
    all.delete_if {|us| us.porcentaje_avance < 100 }
  end

  def self.incompletas
    all.delete_if {|us| us.porcentaje_avance >= 100 }
  end

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

  def porcentaje_avance
    if self.tarea.count > 0
      avance = 0
      self.tarea.each do |tarea|
        avance += tarea.porcentaje_avance
      end
      avance /= self.tarea.count
    else
      0
    end
  end

end
