class CreateEstadosCita < ActiveRecord::Migration
  def change
    create_table :estados_cita do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
