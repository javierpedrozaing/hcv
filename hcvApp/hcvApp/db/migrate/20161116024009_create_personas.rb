class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre
      t.string :apellidos
      t.integer :edad
      t.string :genero
      t.string :direccion
      t.string :telefono
      t.integer :celular
      t.string :estado_civil
      t.date :fecha_nacimiento

      t.timestamps null: false
    end
  end
end
