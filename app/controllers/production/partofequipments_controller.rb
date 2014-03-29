class Production::PartofequipmentsController < ApplicationController
  def index
    @combo_opcions = []
    if !params[:partedeequipo_campo].nil? and !params[:partedeequipo_opcion].nil?
      partedeequipo_campo =  params[:partedeequipo_campo].to_i
      partedeequipo_opcion = params[:partedeequipo_opcion]
      @array_partedeequipos = Partofequipment.all
      if partedeequipo_campo == 1
        @partofequipments = Partofequipment.where('id = ?',partedeequipo_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_partedeequipos.each do |opcion|
          @combo_opcions << [opcion.numero,opcion.id]
        end
      elsif partedeequipo_campo == 2
        @partofequipments = Partofequipment.where('subcontractofequipment_id = ?',partedeequipo_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_partedeequipos.each do |opcion|
          @combo_opcions << ["#{opcion.subcontractofequipment.supplier.entity.nombre} #{opcion.subcontractofequipment.supplier.entity.apellido} #{opcion.subcontractofequipment.supplier.entity.razon_social}",opcion.subcontractofequipment.id]
        end
      elsif partedeequipo_campo == 3
        @partofequipments = Partofequipment.where('equipmentsofsubcontract_id = ?',partedeequipo_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_partedeequipos.each do |opcion|
          @combo_opcions << ["#{opcion.equipmentsofsubcontract.codigo} #{opcion.equipmentsofsubcontract.descripcion}",opcion.equipmentsofsubcontract.id]
        end
      elsif partedeequipo_campo == 4
        @partofequipments = Partofequipment.where('fecha = ?',partedeequipo_opcion).paginate(:page => params[:page], :per_page => 20).order('id Desc')                      
        @array_partedeequipos.each do |opcion|
          @combo_opcions << ["#{opcion.fecha}",opcion.fecha]
        end
      end
      @combo_opcions = elimina_repetidos(@combo_opcions)      
    else
      @partofequipments = Partofequipment.paginate(:page => params[:page], :per_page => 20).order('fecha Desc')
    end

    respond_to do |format|
      format.html 
      format.json { render json: @partedeequipos }
    end
  end

  def show
    @partofequipment = Partofequipment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @partofequipment }
    end
  end

  def new
    @partofequipment = Partofequipment.new
    @partedeequipo_last = Partofequipment.last
    if @partedeequipo_last.nil?
      @partedeequipo_numero = 0 + 1
    else
      @partedeequipo_numero = @partedeequipo_last.numero.to_i + 1
    end

    respond_to do |format|
      format.html 
      format.json { render json: @partofequipment }
    end
  end

  def edit
    @partofequipment = Partofequipment.find(params[:id])
  end

  def create
    @partofequipment = Partofequipment.new(partofequipment_parameters)
    respond_to do |format|
      if @partofequipment.save
        format.html { redirect_to production_partofequipment_path(@partofequipment), notice: 'Partedeequipo was successfully created.' }
        format.json { render json: @partofequipment, status: :created, location: @partofequipment }
      else
        format.html { render action: "new" }
        format.json { render json: @partofequipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @partofequipment = Partofequipment.find(params[:id])

    respond_to do |format|
      if @partofequipment.update_attributes(partofequipment_parameters)
        format.html { redirect_to production_partofequipment_path(@partofequipment), notice: 'Partedeequipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @partofequipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partofequipment = Partofequipment.find(params[:id])
    @partofequipment.destroy
    respond_to do |format|
      format.html { redirect_to partofequipments_url }
      format.json { head :no_content }
    end
  end


  def values_equiposdesubcontrato
    if !params[:id].nil?
      id = params[:id]
      @equiposdesubcontratos = Equipmentsofsubcontract.where(subcontractofequipment_id: id)
    else
      id = 0
      @equipmentsofsubcontracts = 0
    end   
    
    respond_to do |format|
      format.html {render :layout => 'select'}
    end
  end

  def values_unidades
    if !params[:id].nil?
      id = params[:id] 
      @equiposdesubcontrato = Equipmentsofsubcontract.find_by_id(id)
    else

    end

    respond_to do |format|
      format.html {render :layout => 'select'}
    end    

  end


  def values_opcion
    id = params[:id].to_i
    @combo_opcions = []
    if id == 1
      @partedeequipos = Partofequipment.all
      @partedeequipos.each do |opcion|
        @combo_opcions << [opcion.id,opcion.numero]
      end
    elsif id == 2
      @partedeequipos = Partofequipment.all
      @partedeequipos.each do |opcion|
        @combo_opcions << [opcion.subcontractofequipment.id,"#{opcion.subcontractofequipment.supplier.entity.nombre} #{opcion.subcontractofequipment.supplier.entity.apellido} #{opcion.subcontractofequipment.supplier.entity.razon_social}"]        
      end
    elsif id == 3
      @partedeequipos = Partofequipment.all
      @partedeequipos.each do |opcion|
        @combo_opcions << [opcion.equipmentsofsubcontract.id,"#{opcion.equipmentsofsubcontract.codigo} #{opcion.equipmentsofsubcontract.descripcion}"]        
      end
    elsif id == 4
      @partedeequipos = Partofequipment.all
      @partedeequipos.each do |opcion|
        @combo_opcions << [opcion.fecha,"#{opcion.fecha}"]
      end
    end

    @combo_opcions = elimina_repetidos(@combo_opcions)
    
    respond_to do  |format|
      format.html {render :layout => 'select'}
    end 
  end
  

  def elimina_repetidos(combo_opcions)
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = combo_opcions.count - 1
        reset = 0
        while i <= imax && reset == 0
            k = 0
            repe = 0
            while k <= imax && repe < 2
                if combo_opcions[i][0] == combo_opcions[k][0]
                    repe += 1
                end
                k += 1
            end
            if repe == 2
                k = k - 1
                combo_opcions.delete_at(k)
                reset += 1
            end
            i += 1
        end
        if i == combo_opcions.count
            reset_principal += 1
        end
    end
    return combo_opcions
  end
  private
  def partofequipment_parameters
    params.require(:partofequipment).permit!
    #params.require(:partofequipment).permit(:fecha, :equipmentsofsubcontract_id, :numero, :subcontractofequipment_id, :inicio, :fin, :diferencia, :combustible_cantidad, :catalogofwork_id, :fueltype_id, :stand_by, :mantenimiento, :aprobado, :equipmentregisters_attributes)
  end
end
