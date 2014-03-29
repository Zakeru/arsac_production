class Production::MaquinariaequipodetallesController < ApplicationController
  def index
    @maquinariaequipodetalles = Maquinariaequipodetalle.all

    respond_to do |format|
      format.html 
      format.json { render json: @maquinariaequipodetalles }
    end
  end

  def show
    @maquinariaequipodetalle = Maquinariaequipodetalle.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @maquinariaequipodetalle }
    end
  end

  def new
    @maquinariaequipodetalle = Maquinariaequipodetalle.new

    respond_to do |format|
      format.html 
      format.json { render json: @maquinariaequipodetalle }
    end
  end

  def edit
    @maquinariaequipodetalle = Maquinariaequipodetalle.find(params[:id])
  end

  def create
    @maquinariaequipodetalle = Maquinariaequipodetalle.new(params[:maquinariaequipodetalle])

    respond_to do |format|
      if @maquinariaequipodetalle.save
        format.html { redirect_to @maquinariaequipodetalle, notice: 'Maquinariaequipodetalle was successfully created.' }
        format.json { render json: @maquinariaequipodetalle, status: :created, location: @maquinariaequipodetalle }
      else
        format.html { render action: "new" }
        format.json { render json: @maquinariaequipodetalle.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @maquinariaequipodetalle = Maquinariaequipodetalle.find(params[:id])

    respond_to do |format|
      if @maquinariaequipodetalle.update_attributes(params[:maquinariaequipodetalle])
        format.html { redirect_to @maquinariaequipodetalle, notice: 'Maquinariaequipodetalle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maquinariaequipodetalle.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @maquinariaequipodetalle = Maquinariaequipodetalle.find(params[:id])
    @maquinariaequipodetalle.destroy

    respond_to do |format|
      format.html { redirect_to maquinariaequipodetalles_url }
      format.json { head :no_content }
    end
  end

  private 
  def maquinariaequipodetalle_parameters
    params.require(:maquinariaequipodetalle).permit(:combustible, :fecha, :horas_efectivas, :horometro_fin, :horometro_horas, :horometro_inicio, :maquinariaequipo_id, :numero, :parte, :suministro)
  end
end
