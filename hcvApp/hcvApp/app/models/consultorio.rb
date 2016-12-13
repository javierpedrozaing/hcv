class Consultorio < ActiveRecord::Base
  belongs_to :municipio
  belongs_to :clientes
  
end
