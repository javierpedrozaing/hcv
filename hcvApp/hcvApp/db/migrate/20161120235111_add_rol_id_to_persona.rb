class AddRolIdToPersona < ActiveRecord::Migration
  def change
  	add_column :personas, :rol_id, :integer
  end
end
