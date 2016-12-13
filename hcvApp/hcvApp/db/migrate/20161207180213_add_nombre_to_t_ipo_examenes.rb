class AddNombreToTIpoExamenes < ActiveRecord::Migration
  def change
  	add_column :tipo_examenes, :nombre, :string
  end
end
