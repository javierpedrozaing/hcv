class AddFieldsToPerfilExamenes < ActiveRecord::Migration
  def change
  	add_column :perfil_examenes, :perfil_id, :integer
  	add_column :perfil_examenes, :tipo_examen_id, :integer
  end
end
