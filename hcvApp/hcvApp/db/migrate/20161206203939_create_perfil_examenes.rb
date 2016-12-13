class CreatePerfilExamenes < ActiveRecord::Migration
  def change
    create_table :perfil_examenes do |t|

      t.timestamps null: false
    end
  end
end
