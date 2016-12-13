class AddCitasAsignadasToCliente < ActiveRecord::Migration
  def change
  	add_column :clientes, :citas_asignadas, :integer
  	add_column :clientes, :citas_cumplidas, :integer
  	add_reference :clientes, :perfil, index: true
  end
end
