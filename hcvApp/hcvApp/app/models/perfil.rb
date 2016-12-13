class Perfil < ActiveRecord::Base	
	has_many :tipo_examenes
	has_many :tipo_examenes, through: :perfil_examen

	has_many :cliente_perfils
	has_many :clientes, through: :cliente_perfils

end
