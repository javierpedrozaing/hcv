class CreatePersonaRols < ActiveRecord::Migration
  def change
    create_table :persona_rols do |t|
      t.integer :persona_id
      t.integer :rol_id

      t.timestamps null: false
    end
  end
end
