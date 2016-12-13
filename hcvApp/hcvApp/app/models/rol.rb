class Rol < ActiveRecord::Base
	has_many :persona_rols, :class_name => "PersonaRol"
	has_many :personas, through: :persona_rols
end
