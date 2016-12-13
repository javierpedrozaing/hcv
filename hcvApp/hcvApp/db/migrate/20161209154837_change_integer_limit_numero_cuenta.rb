class ChangeIntegerLimitNumeroCuenta < ActiveRecord::Migration
  def change
  	change_column :clientes, :numero_cuenta, :integer, limit: 14
  end
end
