class AddPersonToMedicos < ActiveRecord::Migration
  def change
  	add_reference :medicos, :persona, index: true, foreign_key: true
  end
end
