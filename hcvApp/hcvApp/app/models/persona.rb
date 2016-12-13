class Persona < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_one :cliente
	has_one :medico
	
	has_attached_file :photo
	#validates_attachment_content_type :photo, content_type: /\Aimage/
	do_not_validate_attachment_file_type :photo
	#validates_attachment_presence :archivo
	has_one :persona_rols, :class_name => "PersonaRol"
	has_one :rols, through: :persona_rols

	# => Valida el mail del usuario
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, 
	                  format: { with: VALID_EMAIL_REGEX }	                  

	def perfiles
    	self.rols
  	end
end
