class CreatePacientes < ActiveRecord::Migration
  def change
    create_table :pacientes do |t|
      t.string :hora_ingreso
      t.string :ciudad_ingreso
      t.string :tipo_examen

      t.timestamps null: false
    end
  end
end
