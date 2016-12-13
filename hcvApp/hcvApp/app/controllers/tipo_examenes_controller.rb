class TipoExamenesController < ApplicationController
  before_action :set_tipo_examene, only: [:show, :edit, :update, :destroy]

  # GET /tipo_examenes
  # GET /tipo_examenes.json
  def index
    @tipo_examenes = TipoExamene.all
  end

  # GET /tipo_examenes/1
  # GET /tipo_examenes/1.json
  def show
  end

  # GET /tipo_examenes/new
  def new
    @tipo_examene = TipoExamene.new
  end

  # GET /tipo_examenes/1/edit
  def edit
  end

  # POST /tipo_examenes
  # POST /tipo_examenes.json
  def create
    @tipo_examene = TipoExamene.new(tipo_examene_params)

    respond_to do |format|
      if @tipo_examene.save
        format.html { redirect_to @tipo_examene, notice: 'Tipo examene was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_examene }
      else
        format.html { render :new }
        format.json { render json: @tipo_examene.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_examenes/1
  # PATCH/PUT /tipo_examenes/1.json
  def update
    respond_to do |format|
      if @tipo_examene.update(tipo_examene_params)
        format.html { redirect_to @tipo_examene, notice: 'Tipo examene was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_examene }
      else
        format.html { render :edit }
        format.json { render json: @tipo_examene.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_examenes/1
  # DELETE /tipo_examenes/1.json
  def destroy
    @tipo_examene.destroy
    respond_to do |format|
      format.html { redirect_to tipo_examenes_url, notice: 'Tipo examene was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_examene
      @tipo_examene = TipoExamene.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_examene_params
      params.require(:tipo_examene).permit(:nombre, :perfil_id)
    end
end
