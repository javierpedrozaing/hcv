class PersonasController < ApplicationController
	before_action :authenticate_persona!
  before_action :set_persona, only: [:show, :edit, :update, :destroy]
  require 'csv'
  # GET /personas
  # GET /personas.json
  #comentario para actualizar el git
  
  def index
    authorize self 
    @personas = Persona.all
  end

  # GET /personas/1
  # GET /personas/1.json
  def show
    #authorize :persona, :show? 
    #@persona=Persona.personas.find(params[:id])
    redirect_to url_for(:controller => :home, :action => :index)
  end
  #private
   # def persona_rol_index(persona)
    #  case persona.rol.rol
    #  when 'Ministerio'
    #   ministerios_path              
    #  end
   # end

  # GET /personas/new
  def new
    authorize self 
    @persona = Persona.new
  end

  # GET /personas/1/edit
  def edit
   #authorize :persona, :edit? 
   @tipo_documento=TipoDocumento.all 
   @estados = Estado.all.distinct(:estado)
   #@path_redirection = ruta_perfiles(params[:id]);#llamamos a la url segun perfil 
  end

  # POST /personas
  # POST /personas.json
  def create
    authorize self 
    @persona = Persona.new(persona_params)
    respond_to do |format|
      if @persona.save
        format.html { redirect_to administracion_path, notice: 'Persona se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personas/1
  # PATCH/PUT /personas/1.json
  def update
    #authorize :persona, :update? 
    #@path_redirection = ruta_perfiles(@persona); #llamamos a la url segun perfil
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to :back, notice: 'Persona se ha actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personas/1
  # DELETE /personas/1.json
  def destroy
    authorize self
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona fue destruido con éxito.' }
      format.json { head :no_content }
    end
  end 
  
 private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:nombre,:tipo_documento_id, :documento,:email, :estado_id)
    end
end