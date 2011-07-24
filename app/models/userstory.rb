class Userstory < ActiveRecord::Base
    validates :proyecto, :presence => true

    belongs_to :proyecto
    belongs_to :usuario
    has_many :tarea

end
