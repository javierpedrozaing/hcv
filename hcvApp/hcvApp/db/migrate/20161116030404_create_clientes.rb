class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nit
      t.string :tarifa
      t.string :tipo_cuenta
      t.integer :numero_cuenta
      t.string :banco
      t.string :tipo_negociacion
      t.integer :id_persona

      t.timestamps null: false
    end
  end
end
