class Production::ValesdeconsumosController < ApplicationController
  # GET /valesdeconsumos
  # GET /valesdeconsumos.json
  def index
    #@valesdeconsumos = Valesdeconsumo.all
    @valesdeconsumos = Valesdeconsumo.where('lower(numero_vale) like ?',"%#{params[:search]}%").paginate(:page => params[:page], :per_page => 20).order('id Desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @valesdeconsumos }
    end
  end

  # GET /valesdeconsumos/1
  # GET /valesdeconsumos/1.json
  def show
    @valesdeconsumo = Valesdeconsumo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @valesdeconsumo }
    end
  end

  # GET /valesdeconsumos/new
  # GET /valesdeconsumos/new.json
  def new
    @valesdeconsumo = Valesdeconsumo.new
    @sectores = Sectore.all  

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @valesdeconsumo }
    end
  end

  # GET /valesdeconsumos/1/edit
  def edit
    @valesdeconsumo = Valesdeconsumo.find(params[:id])
    @sectores = Sectore.all  
  end

  # POST /valesdeconsumos
  # POST /valesdeconsumos.json
  def create
    @valesdeconsumo = Valesdeconsumo.new(params[:valesdeconsumo])
    @sectores = Sectore.all  

    respond_to do |format|
      if @valesdeconsumo.save
        format.html { redirect_to new_valesdeconsumo_path, notice: 'El vale de Consumo se guardo exitosamente ..!' }
        format.json { render json: @valesdeconsumo, status: :created, location: @valesdeconsumo }
      else
        format.html { render action: "new" }
        format.json { render json: @valesdeconsumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /valesdeconsumos/1
  # PUT /valesdeconsumos/1.json
  def update
    @valesdeconsumo = Valesdeconsumo.find(params[:id])
    @sectores = Sectore.all  

    respond_to do |format|
      if @valesdeconsumo.update_attributes(params[:valesdeconsumo])
        format.html { redirect_to @valesdeconsumo, notice: 'Valesdeconsumo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @valesdeconsumo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /valesdeconsumos/1
  # DELETE /valesdeconsumos/1.json
  def destroy
    @valesdeconsumo = Valesdeconsumo.find(params[:id])
    @valesdeconsumo.destroy

    respond_to do |format|
      format.html { redirect_to valesdeconsumos_url }
      format.json { head :no_content }
    end
  end

  private 
  def valesdeconsumo_parameters
    params.require(:valesdeconsumo).permit(:numero_vale, :groupsofwork_id, :tipo_vale, :supplier_id, :tipo_material, :cantidad, :fecha_de_ingreso, :front_id)
  end

end
