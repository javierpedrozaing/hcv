class CreatePersonas < ActiveRecord::Migration
  def change
    create_table :personas do |t|
      t.string :nombre_completo
      t.integer :edad
      t.string :genero
      t.string :direccion
      t.string :telefono
      t.string :celular
      t.string :estado_civil
      t.date :fecha_nacimiento
      t.string :lugar_nacimiento
      t.integer :documento
      t.string :tipo_documento
      t.string :email2

      t.timestamps null: false
    end
  end
end
