class AddClienteIdToMedico < ActiveRecord::Migration
  def change
  	add_reference :medicos, :cliente, index: true
  	add_reference :medicos, :consultorio, index: true
  	
  end
end
