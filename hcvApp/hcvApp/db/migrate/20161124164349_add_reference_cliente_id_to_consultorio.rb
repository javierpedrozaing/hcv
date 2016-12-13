class AddReferenceClienteIdToConsultorio < ActiveRecord::Migration
  def change
  	add_reference :consultorios, :cliente, index: true
  end
end
