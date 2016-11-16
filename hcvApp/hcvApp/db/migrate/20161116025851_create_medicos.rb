class CreateMedicos < ActiveRecord::Migration
  def change
    create_table :medicos do |t|
      t.string :tipo_consulta
      t.integer :consultorio_id
      t.string :tipo_contrato
      t.string :actividad_economica
      t.string :banco
      t.string :tipo_cuenta
      t.integer :numero_cuenta
      t.string :tarifa
      t.integer :horas_salud_ocupacional
      t.integer :horas_medicina_laboral
      t.boolean :activo

      t.timestamps null: false
    end
  end
end
