class CreateTipoExamenes < ActiveRecord::Migration
  def change
    create_table :tipo_examenes do |t|

      t.timestamps null: false
    end
  end
end
