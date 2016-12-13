class RenameColumnsToMedico < ActiveRecord::Migration
  def change
  	rename_column :medicos, :horas_salud_ocupacional, :eventos_salud_ocupacional
  	rename_column :medicos, :horas_medicina_laboral, :eventos_medicina_laboral
  end
end
