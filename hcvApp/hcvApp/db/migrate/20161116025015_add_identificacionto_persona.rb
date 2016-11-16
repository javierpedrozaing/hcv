class AddIdentificaciontoPersona < ActiveRecord::Migration
  def change
  	add_column :personas, :documento, :integer
  	add_column :personas, :tipo_documento, :string

  end
end
