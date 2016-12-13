class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.integer :nit
      t.string :tarifa
      t.string :tipo_cuenta
      t.integer :numero_cuenta
      t.string :banco
      t.string :tipo_negociacion
      t.string :eventos_salud_ocupacional
      t.string :eventos_medicina_laboral
      t.references :persona, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
