class Cliente < ActiveRecord::Base
  
  belongs_to :persona, class_name: "Persona", foreign_key: "persona_id", dependent: :destroy
  has_many :consultorios
  has_many :cliente_perfils
  has_many :perfils, through: :cliente_perfils
  validates :numero_cuenta, length: { maximum: 12 } 
  before_save :default_values
  before_update :default_values

  def default_values 
  	self.activo ||= 0
  end
	
end
