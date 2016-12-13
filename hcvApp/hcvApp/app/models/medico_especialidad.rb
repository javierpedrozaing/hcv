class MedicoEspecialidad < ActiveRecord::Base
  belongs_to :medico
  belongs_to :especialidad
end
