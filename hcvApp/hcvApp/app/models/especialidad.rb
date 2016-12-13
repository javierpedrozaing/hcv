class Especialidad < ActiveRecord::Base	
	has_many :medico_especialidads, :class_name => "MedicoEspecialidad"
	has_many :medicos, through: :medico_especialidads
	
end
