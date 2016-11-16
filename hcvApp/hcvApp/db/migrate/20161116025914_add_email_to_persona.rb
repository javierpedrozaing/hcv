class AddEmailToPersona < ActiveRecord::Migration
  def change
  	add_column :personas, :email, :string
  	add_column :personas, :email_2, :string
  end
end
