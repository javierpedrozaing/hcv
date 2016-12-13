class CreateMedicoEspecialidads < ActiveRecord::Migration
  def change
    create_table :medico_especialidads do |t|
      t.references :medico, index: true, foreign_key: true
      t.references :especialidad, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
