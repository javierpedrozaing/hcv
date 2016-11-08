class AdministradorController < ApplicationController
 skip_before_filter :verify_authenticity_token 
  def admin_medico
  end

  def medico

  end

  def clientes
  end

  def detalle_cliente
  end

  def perfiles

  end

  def index

  end

  def citasPorMedico
  end

  def registrar_medico
    render "administrador/medico"
  end

end
