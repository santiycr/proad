class Tarea < ActiveRecord::Base
    belongs_to :userstory
    validates_presence_of :userstory
    validates_numericality_of :porcentaje_avance,
      :only_integer => true,
      :less_than_or_equal_to => 100,
      :message => "debe ser inferior a 100"
    validates_numericality_of :horas_dedicadas,
      :only_integer => true,
      :message => "debe ser un numero"
end
