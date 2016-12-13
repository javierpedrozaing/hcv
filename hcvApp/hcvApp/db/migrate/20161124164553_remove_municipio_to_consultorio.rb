class RemoveMunicipioToConsultorio < ActiveRecord::Migration
  def change
  	remove_column :consultorios, :municipio_id, :integer
  	add_column :clientes, :municipio_id, :integer
  end
end
