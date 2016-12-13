class AddColumnServiciosToCliente < ActiveRecord::Migration
  def change
  	add_column :clientes, :servicios, :string
  end
end
