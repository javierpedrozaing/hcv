class AddEventosToClientes < ActiveRecord::Migration
  def change
  	add_column :clientes, :eventos_salud_ocupacional, :integer
  	add_column :clientes, :eventos_medicina_laboral, :integer
  end
end
