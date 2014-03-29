class Production::MaquinariaequiporesumenesController < ApplicationController
  def index
    @maquinariaequiporesumenes = Maquinariaequiporesumene.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maquinariaequiporesumenes }
    end
  end

  def show
    @maquinariaequiporesumene = Maquinariaequiporesumene.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maquinariaequiporesumene }
    end
  end

  def new
    @maquinariaequiporesumene = Maquinariaequiporesumene.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maquinariaequiporesumene }
    end
  end

  def edit
    @maquinariaequiporesumene = Maquinariaequiporesumene.find(params[:id])
  end

  def create
    @maquinariaequiporesumene = Maquinariaequiporesumene.new(params[:maquinariaequiporesumene])

    respond_to do |format|
      if @maquinariaequiporesumene.save
        format.html { redirect_to @maquinariaequiporesumene, notice: 'Maquinariaequiporesumene was successfully created.' }
        format.json { render json: @maquinariaequiporesumene, status: :created, location: @maquinariaequiporesumene }
      else
        format.html { render action: "new" }
        format.json { render json: @maquinariaequiporesumene.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @maquinariaequiporesumene = Maquinariaequiporesumene.find(params[:id])

    respond_to do |format|
      if @maquinariaequiporesumene.update_attributes(params[:maquinariaequiporesumene])
        format.html { redirect_to @maquinariaequiporesumene, notice: 'Maquinariaequiporesumene was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maquinariaequiporesumene.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @maquinariaequiporesumene = Maquinariaequiporesumene.find(params[:id])
    @maquinariaequiporesumene.destroy
    respond_to do |format|
      format.html { redirect_to maquinariaequiporesumenes_url }
      format.json { head :no_content }
    end
  end

  private
  def maquinariaequiporesumene_parameters
    params.require(:maquinariaequiporesumene).permit(:reportofmachinery_id, :equipmentofsubcontract_id, :nombre_equipo, :unidad, :precio_unitario, :acumulado_anterior_metrado, :acumulado_anterior_monto, :presente_valorizacion_metrado, :presente_valorizacion_monto, :acumulado_actual_metrado, :acumulado_actual_monto, :inicio, :fin, :machineryequipmentdetails_attributes)
  end
end
