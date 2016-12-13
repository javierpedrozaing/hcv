class RemoveColumnRolId < ActiveRecord::Migration
  def change
  	remove_column :personas, :rol_id, :integer
  end
end
