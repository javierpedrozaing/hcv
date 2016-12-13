# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###################################################
# Personas:
###################################################
personas = Persona.create([
	{
	nombre_completo: "Juan Perez",
	edad: "30",
	genero: "Masculino",
	telefono: "7406050",
	celular: "3114426177",
	estado_civil: 'soltero',
	documento: "1049610014"	,
	email: 'cliente@gmail.com',
	password: '12345678',
	password_confirmation: '12345678'
	},

	{
	nombre_completo: "Andrea Caval",
	edad: "29",
	genero: "Femenino",
	telefono: "7406050",
	celular: "3114426177",
	estado_civil: 'soltero',
	documento: "73445345",
	email: 'medico@gmail.com',
	password: '12345678',
	password_confirmation: '12345678'
	},

	{
	nombre_completo: "Mauricio Blanco",
	edad: "29",
	genero: "Masculino",
	telefono: "7605904",
	celular: "32145634342",
	estado_civil: 'soltero',
	documento: "73445345",
	email: 'administrador@gmail.com',
	password: '12345678',
	password_confirmation: '12345678'
	},

	{
	nombre_completo: "Javier Pedroza",
	edad: "29",
	genero: "Masculino",
	telefono: "7605904",
	celular: "32145634342",
	estado_civil: 'soltero',
	documento: "73445345",
	email: 'confirmacitas@gmail.com',
	password: '12345678',
	password_confirmation: '12345678'
	}
])

###################################################
# Roles:
###################################################

roles = Rol.create([
	
	{ nombre: "Cliente"},
	{ nombre: "Medico"},
	{ nombre: "Administrador"},
	{ nombre: "Confirmar Citas"}

])


###################################################
# PersonaROl
###################################################
persona_rol = PersonaRol.create([
	{ 
	persona_id: "1",
	rol_id: "1"
	},

	{ 
	persona_id: "2",
	rol_id: "2"
	},

	{ 
	persona_id: "3",
	rol_id: "3"
	},

	{ 
	persona_id: "4",
	rol_id: "4"
	}
	

])

especialidad = Especialidad.create([
	{
		nombre: "Salud Ocupacional"
	},

	{
		nombre: "Medicina Laboral"
	}
])


perfil = Perfil.create([
	{
		nombre: '1'
	},
	{
		nombre: '2'
	},
	{
		nombre: '3'
	}
])

tipo_examen = TipoExamene.create([
	{
		nombre: 'Audiometría',		
	},

	{
		nombre: 'Visiometría',		
	},

	{
		nombre: 'Optometría',		
	},

	{
		nombre: 'Electrocardiograma',		
	}

])