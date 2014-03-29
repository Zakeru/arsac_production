class Production::SubcontractofequipmentsController < ApplicationController

  def index
    @subcontractofequipments = Subcontractofequipment.all

    respond_to do |format|
      format.html 
      format.json { render json: @subcontractofequipments }
    end
  end

  def show
    @subcontractofequipment = Subcontractofequipment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @subcontractofequipment }
    end
  end

  def new
    @subcontractofequipment = Subcontractofequipment.new

    respond_to do |format|
      format.html 
      format.json { render json: @subcontractofequipment }
    end
  end

  def edit
    @subcontractofequipment = Subcontractofequipment.find(params[:id])
  end

  def create
    @subcontractofequipment = Subcontractofequipment.new(subcontractofequipment_parameters)

    respond_to do |format|
      if @subcontractofequipment.save
        format.html { redirect_to production_subcontractofequipment_path(@subcontractofequipment), notice: 'subcontractofequipment was successfully created.'}
        format.json { render json: @subcontractofequipment, status: :created, location: @subcontractofequipment }
      else
        format.html { render action: "new" }
        format.json { render json: @subcontractofequipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @subcontractofequipment = Subcontractofequipment.find(params[:id])

    respond_to do |format|
      if @subcontractofequipment.update_attributes(subcontractofequipment_parameters)
        format.html { redirect_to production_subcontractofequipment_path(@subcontractofequipment), notice: 'subcontractofequipment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcontractofequipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subcontractofequipment = Subcontractofequipment.find(params[:id])
    @subcontractofequipment.destroy

    respond_to do |format|
      format.html { redirect_to subcontractofequipments_url }
      format.json { head :no_content }
    end
  end

  def ver_equipos
    subcontractofequipments = Subcontractofequipment.find_by_id(params[:id])
    @subcontractofequipment = "#{subcontractofequipments.supplier.entity.nombre} #{subcontractofequipments.supplier.entity.apellido} #{subcontractofequipments.supplier.entity.razon_social}"
    @subcontractofequipment_id = subcontractofequipments.id
    @equipos = Equipmentsofsubcontract.where("subcontractofequipment_id = ?",params[:id]).order('id Desc')
  end

  def equipoadd
    @subcontractofequipment = Subcontractofequipment.find_by_id(params[:id])
  end

  def equipoedit
    @equiposdesubcontrato = Equiposdesubcontrato.find_by_id(params[:id])
  end

  def equipover
    @equiposdesubcontrato = Equiposdesubcontrato.find_by_id(params[:id])
  end

  private
  def subcontractofequipment_parameters
    params.require(:subcontractofequipment).permit(:adelanto, :adelanto_detalle, :condiciones_de_pago, :fondo_de_garantia, :igv, :supplier_id, :valorizacion, :amortizacion_inicial_numero, :amortizacion_inicial_porcentaje, :fondo_de_garantia_porcentaje, :detraccion_porcentaje, :adelanto_1_numero, :adelanto_1_fecha, :adelanto_2_numero, :adelanto_2_fecha, :adelanto_3_numero, :adelanto_3_fecha, :adelanto_4_numero, :adelanto_4_fecha, :monto_contratado_suma, :cantidad_contratada)
  end

end
