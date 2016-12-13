class CreateCita < ActiveRecord::Migration
  def change
    create_table :cita do |t|
      t.date :fecha
      t.time :hora

      t.timestamps null: false
    end
  end
end
