class AdministradorController < ApplicationController
  
  layout "administrator"
  #alias_method :current_user, :current_persona
  skip_before_filter :verify_authenticity_token 
  
  before_action :authenticate_persona!
  
  def admin_medico
    authorize self
  end

  def medico

  end

  def clientes
    authorize self
    @cliente = Cliente.new   
    @persona = Persona.new 
    @clientes = Cliente.all
    @perfiles = Perfil.all

  end

  def reporte_cliente
    @cliente = Cliente.find(params[:id])

  end

  def perfiles
    authorize self

  end

  def index    
    @persona = current_persona

  end

  def crear_cliente
    authorize self        
    
    @persona = Persona.new(persona_params)
    perfiles = params[:perfiles]

    
    unless @persona.photo_file_name.nil?
      puts "no hay arhcivo adjunto"
    end
    @cliente = Cliente.new(cliente_params)
    Cliente.transaction do   
      rol = params[:cliente][:rol]
      rols = Rol.select("id").where(:nombre => rol).first
              
      @persona.save
                 
      if @persona.save
        
        unless rols.nil?
          persona_rol = PersonaRol.create(:persona_id => @persona.id, :rol_id => rols.id)
        end

        @cliente.persona_id = @persona.id
        @cliente.activo = params[:activo]

          respond_to do |format|
            if @cliente.save          
              
              if perfiles.length > 1
                perfiles.each do |perfil|
                  cliente_perfil = ClientePerfil.new
                  cliente_perfil.id_perfil = perfil
                  cliente_perfil.id_cliente = @cliente.id
                  cliente_perfil.save
                  
                end
              else
                cliente_perfil.id_perfil = perfil
                cliente_perfil.id_cliente = @cliente.id
                cliente_perfil.save
              end

              format.html { redirect_to :proveedores, notice: 'Cliente registrado correctamente' }
              
            else                          
              format.html { redirect_to :proveedores, notice: 'No se pudo crear el cliente correctamente' }
              format.json { render json: @cliente.errors, status: :unprocessable_entity }
              raise ActiveRecord::Rollback
            end
          end
      else
        
        respond_to do |format|
          format.html { redirect_to :proveedores, notice: 'No se pudo crear el cliente correctamente' }
          format.json { render json: @persona.errors, status: :unprocessable_entity }
        end
        
      end

    end #cierra transaction
  end #cierra función

  def show_cliente
    @cliente = Cliente.find(params[:id])

    respond_to do |format|
        format.html # show_cliente.html.erb
        format.js # show_cliente.js.erb
        format.json { render json: @cliente }
    end
  end


  def edit_cliente
     @cliente = Cliente.find(params[:id])
     @persona = Persona.find(@cliente.persona_id)
     @perfiles = Perfil.all
     cliente_perfil = ClientePerfil.where(:id_cliente => @cliente.id)
     @perfils_cliente = cliente_perfil.map {|c| c.id_perfil}

    respond_to do |format|
        format.html {render :edit_cliente } # edit_cliente.html.erb
        #format.js # edit_cliente.js.erb
        format.json { render json: @cliente }
    end
  end

  def delete_cliente
    
    @cliente = Cliente.find(params[:id])
    @cliente.destroy
    respond_to do |format|
      format.html { redirect_to proveedores_path, notice: 'Cliente eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  def update_cliente
    
    @cliente = Cliente.find(params[:id])
    @persona = Persona.find(@cliente.persona_id)
    
    
    respond_to do |format|

      if @cliente.update(cliente_params) and @persona.update(persona_params)
        if params[:activo].nil?          
          @cliente.update(activo: 0) 
        else
          @cliente.update(activo: 1) 
        end
        format.html { redirect_to proveedores_path, notice: 'Cliente actualizado correctamente' }
        format.json { head :no_content }
      else
        format.html { redirect_to proveedores_path, notice: 'No se pudo actualizar el cliente' }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  def upload_photo_cliente
    
  end


  def citasPorMedico
  end

  def registrar_medico
    render "administrador/medico"
  end


  private
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  def persona_params
    
    params.require(:persona).permit(:nombre_completo, :celular, :email, :telefono, :direccion, :password, :photo)
  end

  def cliente_params      
    params.require(:cliente).permit(:nit, :tarifa, :tipo_cuenta, :numero_cuenta, :banco, :tipo_negociacion, :servicios, :email, :activo)      
  end

  

end
