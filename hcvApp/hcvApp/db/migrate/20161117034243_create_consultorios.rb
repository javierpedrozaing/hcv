class CreateConsultorios < ActiveRecord::Migration
  def change
    create_table :consultorios do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.references :municipio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
