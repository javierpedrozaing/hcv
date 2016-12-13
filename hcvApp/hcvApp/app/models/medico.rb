class Medico < Persona
  belongs_to :persona
  belongs_to :cliente
  belongs_to :consultorio

  has_many :medico_especialidads, :class_name => "MedicoEspecialidad"
  has_many :especialidads, through: :medico_especialidads
end

