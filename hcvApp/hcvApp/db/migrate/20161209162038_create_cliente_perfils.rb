class CreateClientePerfils < ActiveRecord::Migration
  def change
    create_table :cliente_perfils do |t|
      t.integer :id_cliente
      t.integer :id_perfil

      t.timestamps null: false
    end
  end
end
