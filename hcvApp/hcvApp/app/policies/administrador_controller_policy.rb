class AdministradorControllerPolicy < ApplicationPolicy
  
	def clientes?
		permiso = user.rols.nombre == 'Administrador'
    return permiso
	end

	def admin_medico?
    permiso = user.rols.nombre == 'Administrador'
    return permiso
    
  end

  def medico?

    
  end

  def reporte_cliente?
  end

  def perfiles?
    permiso = user.rols.nombre == 'Administrador'
    return permiso

  end

  def index?
    
  end

  def crear_cliente?
    permiso = user.rols.nombre == 'Administrador'
    return permiso
  end


  def show_cliente?
    
  end

  def edit_cliente?
    
  end

  def citasPorMedico?
   
  end

  def registrar_medico?
  
  end
end