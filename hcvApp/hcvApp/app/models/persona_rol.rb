class PersonaRol < ActiveRecord::Base
	belongs_to :rol
	belongs_to :persona
end
