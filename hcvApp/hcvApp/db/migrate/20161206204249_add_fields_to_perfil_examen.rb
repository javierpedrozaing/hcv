class AddFieldsToPerfilExamen < ActiveRecord::Migration
  def change
  	add_column :perfil_examen, :perfil_id, :integer
  	add_column :perfil_examen, :tipo_examen_id, :integer
  end
end
