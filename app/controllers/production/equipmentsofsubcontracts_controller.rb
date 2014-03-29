class Production::EquipmentsofsubcontractsController < ApplicationController
  def index
    @equipmentsofsubcontracts = Equipmentsofsubcontract.all

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentsofsubcontracts }
    end
  end

  def show
    @equipmentsofsubcontract = Equipmentsofsubcontract.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentsofsubcontract }
    end
  end

  def new
    @equipmentsofsubcontract = Equipmentsofsubcontract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @equipmentsofsubcontract }
    end
  end

  def edit
    @equipmentsofsubcontract = Equipmentsofsubcontract.find(params[:id])
  end

  def create
    @equipmentsofsubcontract = Equipmentsofsubcontract.new(equipmentsofsubcontract_parameters)

    respond_to do |format|
      if @equipmentsofsubcontract.save

        # monto_contratado_suma subcontractofequipment
        parcial = params[:equipmentsofsubcontract][:cantidad_contratada].to_f * params[:equipmentsofsubcontract][:precion_sin_igv].to_f
        @subcontractofequipment = Subcontractofequipment.find(params[:equipmentsofsubcontract][:subcontractofequipment_id])
        monto_contratado_suma = @subcontractofequipment.monto_contratado_suma.to_f + parcial        
        @subcontractofequipment.update_attributes(:monto_contratado_suma => "#{monto_contratado_suma}")
        
        format.html { redirect_to "/production/subcontractofequipments/ver_equipos/#{params[:equipmentsofsubcontract][:subcontractofequipment_id]}" }
        format.json { render json: @equipmentsofsubcontract, status: :created, location: @equipmentsofsubcontract }
      else
        format.html { render action: "new" }
        @equipmentsofsubcontract[:subcontractofequipment_id] = params[:equipmentsofsubcontract][:subcontractofequipment_id] 
        format.json { render :json => @equipmentsofsubcontract.errors }
      end
    end


  end

  def update
    @equipmentsofsubcontract = Equipmentsofsubcontract.find(params[:id])
    @subcontractofequipment = Subcontractofequipment.find(params[:equipmentsofsubcontract][:subcontractofequipment_id])        
    anterior_cantidad_contratada = @equipmentsofsubcontract.cantidad_contratada.to_f
    anterior_cantidad_precio_sin_igv = @equipmentsofsubcontract.precion_sin_igv.to_f
    anterior_parcial = anterior_cantidad_contratada * anterior_cantidad_precio_sin_igv
    actual_cantidad_contratada = params[:equipmentsofsubcontract][:cantidad_contratada].to_f
    actual_cantidad_precio_sin_igv = params[:equipmentsofsubcontract][:precion_sin_igv].to_f
    actual_parcial = actual_cantidad_contratada * actual_cantidad_precio_sin_igv
    monto_contratado = @subcontractofequipment.monto_contratado_suma.to_f

    monto_contratado = monto_contratado - anterior_parcial
    monto_contratado = monto_contratado + actual_parcial
        
    

    respond_to do |format|
      if @equipmentsofsubcontract.update_attributes(equipmentsofsubcontract_parameters)
        @subcontractofequipment.update_attributes(:monto_contratado_suma => "#{monto_contratado}")
        format.html { redirect_to "/production/subcontractofequipments/ver_equipos/#{params[:equipmentsofsubcontract][:subcontractofequipment_id]}"}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipmentsofsubcontract.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @equipmentsofsubcontract = Equipmentsofsubcontract.find(params[:equipmentsofsubcontracts_id])
    cantidad_contratada = @equipmentsofsubcontract.cantidad_contratada.to_f
    cantidad_precio_sin_igv = @equipmentsofsubcontract.precion_sin_igv.to_f
    parcial = cantidad_contratada * cantidad_precio_sin_igv
    @subcontractofequipment = Subcontractofequipment.find(@equipmentsofsubcontract.subcontractofequipment_id)
    monto_contratado = @subcontractofequipment.monto_contratado_suma.to_f
    monto_contratado = monto_contratado - parcial

    @partedeequipos = Partofequipment.where('equipmentsofsubcontract_id = ?',params[:equipmentsofsubcontracts_id])
    @partedeequipos_count = @partedeequipos.count


    # eliminacion
    if @partedeequipos_count.to_i == 0
      @subcontractofequipment.update_attributes(:monto_contratado_suma => "#{monto_contratado}")
      @equipmentsofsubcontract.destroy
      redirect_to "/production/subcontractofequipments/ver_equipos/#{params[:subcontractofequipment_id]}"
    else
      redirect_to "/production/subcontractofequipments/ver_equipos/#{@subcontractofequipment.id}?error=1"
    end # end Eliminacion
    
    
  end

  private
  def equipmentsofsubcontract_parameters
    params.require(:equipmentsofsubcontract).permit(:anho, :cantidad_h_m, :codigo, :descripcion, :horas_minimas, :equipmentincluded_id, :inputofequipment_id, :marca, :modelo, :precion_sin_igv, :serie, :subcontractofequipment_id, :unit_id, :fecha, :cantidad_contratada)
  end

end