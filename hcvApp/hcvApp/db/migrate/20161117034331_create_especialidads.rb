class CreateEspecialidads < ActiveRecord::Migration
  def change
    create_table :especialidads do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
