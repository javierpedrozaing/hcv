class AddReferencePersonaToPaciente < ActiveRecord::Migration
  def change
  	add_reference :pacientes, :persona, index: true, foreign_key: true
  end
end
