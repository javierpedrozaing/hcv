class CreateMunicipios < ActiveRecord::Migration
  def change
    create_table :municipios do |t|
      t.string :nombre
      t.references :departamento, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
