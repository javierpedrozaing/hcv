class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :nombre

      t.timestamps null: false
    end
  end
end
