class PerfilsController < ApplicationController
  before_action :set_perfil, only: [:show, :edit, :update, :destroy]
  layout "administrator"
  skip_before_filter :verify_authenticity_token 
  # GET /perfils
  # GET /perfils.json
  def index
    @perfils = Perfil.all
    @tipo_examenes = TipoExamene.all
    @perfil = Perfil.new
  end

  # GET /perfils/1
  # GET /perfils/1.json
  def show
    
    perfil_id = params[:id]
    @perfil = Perfil.find(perfil_id)
    perfil_examenes = PerfilExamene.where(:perfil_id => perfil_id)
    id_examenes = perfil_examenes.map { |p| p.tipo_examen_id }    
    @tipo_examenes = TipoExamene.where(:id => id_examenes)
    byebug
    respond_to do |format|
        format.html # show.html.erb        
        format.js
        format.json
    end
  end

  # GET /perfils/new
  def new
    @perfil = Perfil.new
  end

  # GET /perfils/1/edit
  def edit

    @tipo_examenes = TipoExamene.all

    respond_to do |format|
        format.html # show.html.erb        
        format.js
        format.json { render json: @perfil }
    end
  end


  # POST /perfils
  # POST /perfils.json  

  def create                
    examenes = params[:examenes]
    byebug 

    if !params[:perfil][:nombre].nil? || !params[:perfil][:nombre].blank?
      @perfil = Perfil.new(perfil_params)    
      @perfil.save
    
      respond_to do |format|
        if @perfil.save
        
          examenes.each do |examen|
            @perfil_examenes = PerfilExamene.new
            @perfil_examenes.perfil_id = @perfil.id
            @perfil_examenes.tipo_examen_id = examen
            @perfil_examenes.save
          end  
          
          byebug

          format.html { redirect_to perfils_path, notice: 'El Perfil fue creado exitosamente' }
          format.json { render json: { :examenes => examen } }
        else
          
          format.html { render :new }
          format.json { render json: { :examenes => examen } }
        end
      end
    else
      
      respond_to do |format|        
          format.html { redirect_to perfils_path, notice: 'El Perfil no fue creado correctamente vuelva a intentarlo' }
          format.json { render json: { :examenes => examen } }      
      end
    end  

  end

  # PATCH/PUT /perfils/1
  # PATCH/PUT /perfils/1.json
  def update    
    examenes = params[:examenes]
    
    respond_to do |format|
      if @perfil.update(perfil_params)              
            @perfil_examenes = PerfilExamene.where(:perfil_id => @perfil.id)
            examenes.each do |examen|
              @perfil_examenes.update(@perfil.id, tipo_examen_id: examen )                          
            end
        

        format.html { redirect_to perfils_path, notice: 'El perfil fue actualizado correctamente' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfils/1
  # DELETE /perfils/1.json
  def destroy
    @perfil.destroy
    perfil_examenes = PerfilExamene.where(:perfil_id => @perfil.id)
    perfil_examenes.destroy_all
    respond_to do |format|
      format.html { redirect_to perfils_url, notice: 'El Perfil fue eliminado correctamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      params.require(:perfil).permit(:nombre)
    end
end
