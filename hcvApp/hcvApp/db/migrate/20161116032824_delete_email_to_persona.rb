class DeleteEmailToPersona < ActiveRecord::Migration
  def change
  	remove_column :personas, :email, :string
  end
end
