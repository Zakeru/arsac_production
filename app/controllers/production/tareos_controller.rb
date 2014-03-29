class Production::TareosController < ApplicationController
  # GET /tareos
  # GET /tareos.json
  def index
    @tareos = Tareo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tareos }
    end
  end

  # GET /tareos/1
  # GET /tareos/1.json
  def show
    @tareo = Tareo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tareo }
    end
  end

  # GET /tareos/new
  # GET /tareos/new.json
  def new
    @tareo = Tareo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tareo }
    end
  end

  # GET /tareos/1/edit
  def edit
    @tareo = Tareo.find(params[:id])
  end

  # POST /tareos
  # POST /tareos.json
  def create
    @tareo = Tareo.new(params[:tareo])

    respond_to do |format|
      if @tareo.save
        format.html { redirect_to @tareo, notice: 'Tareo was successfully created.' }
        format.json { render json: @tareo, status: :created, location: @tareo }
      else
        format.html { render action: "new" }
        format.json { render json: @tareo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tareos/1
  # PUT /tareos/1.json
  def update
    @tareo = Tareo.find(params[:id])

    respond_to do |format|
      if @tareo.update_attributes(params[:tareo])
        format.html { redirect_to @tareo, notice: 'Tareo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tareo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareos/1
  # DELETE /tareos/1.json
  def destroy
    @tareo = Tareo.find(params[:id])
    inicio = @tareo.inicio.to_date
    fin    = @tareo.fin.to_date

    dias_habiles = rango_de_dias_habiles(inicio,fin)
    dias_habiles.each do |dia|
      @partediariodepersonals = Partediariodepersonal.where('fecha = ?',dia)
      @partediariodepersonals.each do |partediariodepersonal|
        partediariodepersonal.update_attributes(:aprobado => '')
      end
    end

    @tareo.destroy

    respond_to do |format|
      format.html { redirect_to tareos_url }
      format.json { head :no_content }
    end
  end

  def tareo_subcontratista
    # array subcontratos filtrados
    @array_gruposdetrabajo = array_gruposdetrabajo


    if params[:gruposdetrabajo_id].nil? && params[:inicio].nil? && params[:fin].nil?
      @pase = 0



    else
      @gruposdetrabajo_id     = params[:gruposdetrabajo_id]      
      @inicio             = params[:inicio]      
      @fin                = params[:fin]

      if @gruposdetrabajo_id.present? && @inicio.present? && @fin.present?
        @dias_habiles =  rango_de_dias_habiles(@inicio,@fin)
        @trabajadores_array = tareo_array(@inicio,@fin,@gruposdetrabajo_id,@dias_habiles)        
        gruposdetrabajo = Groupsofwork.find_by_id(@gruposdetrabajo_id)
        @subcontratista_nombre = "#{gruposdetrabajo.sector.descripcion} - #{gruposdetrabajo.subsector.descripcion} - #{gruposdetrabajo.chiefoffront.entity.nombre} #{gruposdetrabajo.chiefoffront.entity.apellido} #{gruposdetrabajo.chiefoffront.entity.razon_social} - #{gruposdetrabajo.subcontract.supplier.entity.nombre} #{gruposdetrabajo.subcontract.supplier.entity.apellido} #{gruposdetrabajo.subcontract.supplier.entity.razon_social} - #{gruposdetrabajo.teacherofwork.entity.nombre} #{gruposdetrabajo.teacherofwork.entity.apellido} #{gruposdetrabajo.teacherofwork.entity.razon_social}"
        if @trabajadores_array.length != 0
          if @dias_habiles.length == 0
            @pase = 3
          else
            @pase = 1
          end
        else
          @pase = 2
        end




      elsif @gruposdetrabajo_id.blank? && @inicio.present? && @fin.present?        
        @dias_habiles =  rango_de_dias_habiles(@inicio,@fin)
        gruposdetrabajos = Groupsofwork.all
        @tareos_total_arrays = []
        @subcontratista_arrays = []
        gruposdetrabajos.each do |gruposdetrabajo|
          temp_tareo = []
          temp_tareo = tareo_array(@inicio,@fin,gruposdetrabajo.id,@dias_habiles)          
          if temp_tareo.length != 0 
            @tareos_total_arrays << temp_tareo
            subcontratista = Subcontrato.find_by_id(gruposdetrabajo.subcontrato_id) 
            subcontratista_nombre = "#{gruposdetrabajo.sectore.descripcion} - #{gruposdetrabajo.subsectore.descripcion} - #{gruposdetrabajo.jefedefrente.ente.nombre} #{gruposdetrabajo.jefedefrente.ente.apellido} #{gruposdetrabajo.jefedefrente.ente.razon_social} - #{gruposdetrabajo.subcontrato.proveedore.ente.nombre} #{gruposdetrabajo.subcontrato.proveedore.ente.apellido} #{gruposdetrabajo.subcontrato.proveedore.ente.razon_social} - #{gruposdetrabajo.maestrodeobra.ente.nombre} #{gruposdetrabajo.maestrodeobra.ente.apellido} #{gruposdetrabajo.maestrodeobra.ente.razon_social}"        
            @subcontratista_arrays << subcontratista_nombre
          end
        end




        if @dias_habiles.length == 0
          @pase = 3
        else
          if @tareos_total_arrays.length != 0
            @pase = 4
          else
            @pase = 2
          end
        end




      else 
        @pase = 3
      end
    end

  end

  def tareo_array(inicio,fin,gruposdetrabajo_id,dias_habiles)
    personals_array = []
    trabajadores_array = []
    partediariodepersonals = Partdayliofperson.where("groupsofwork_id = ? and fecha BETWEEN ? AND ?", gruposdetrabajo_id,inicio,fin)
    partediariodepersonals.each do |partediariodepersonal|
      partediariodepersonal.workers.each do |trabajadore|
              id = trabajadore.catalogofwork.id
              @idd = trabajadore.partdayliofperson.fecha
              nombre = "#{trabajadore.catalogofwork.entity.apellido}, #{trabajadore.catalogofwork.entity.nombre}  #{trabajadore.catalogofwork.entity.razon_social}"
              categoria = "#{trabajadore.catalogofwork.catalogcategorywork.nombre}"              
              total_horas     = trabajadore.total_horas.to_f
              total_normales  = trabajadore.normal.to_f
              total_60        = trabajadore.normal_60.to_f
              total_100       = trabajadore.normal_100.to_f
              rango_dias = []
              dias_habiles.each do |dia|
                if trabajadore.partdayliofperson.fecha  == dia.to_date
                  rango_dias << trabajadore.total_horas.to_f
                else
                  rango_dias << 0
                end               
              end              
              # [0]     =>     id                           trabajadores
              # [1]     =>     nombre                       catalogodetrabajadores
              # [2]     =>     categoria                    catalogotrabajadores
              # [3]     =>     Dias                         exterior calculo de dias
              # [4]     =>     total_horas                  trabajadores 
              # [5]     =>     total_normales               trabajadores
              # [6]     =>     total_60                     trabajadores
              # [7]     =>     total_100                    trabajadores
              trabajadores_array << [id,nombre,categoria,rango_dias,total_horas,total_normales,total_60,total_100]
      end
    end
    return filtra_array_tareos(trabajadores_array)
  end

  def filtra_array_tareos(array_order)
    # empiesa la programacion
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = array_order.count - 1
        reset = 0
        while i <= imax && reset == 0
            k = 0        
            repe = 0          
            while k <= imax && repe < 2
                if array_order[i][0] == array_order[k][0]
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2   
                k = k - 1 
                sub_array_max = array_order[i][3].count - 1
                d = 0
                nuevo_total_horas_suma = 0
                while d <= sub_array_max
                  array_order[i][3][d] = array_order[i][3][d].to_f + array_order[k][3][d].to_f
                  nuevo_total_horas_suma += array_order[i][3][d]
                  d += 1
                end
                array_order[i][4] = nuevo_total_horas_suma
                array_order[i][5] += array_order[k][5]
                array_order[i][6] += array_order[k][6]
                array_order[i][7] += array_order[k][7]                
                array_order.delete_at(k)
                reset += 1
            end                  
            i += 1
        end          
        if i == array_order.count
            reset_principal += 1
        end    
    end    
    return array_order.sort_by{|k| k[1]}    
  end

  def filtra_array_uno(idkey, array_order)
    # empiesa la programacion
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = array_order.count - 1
        reset = 0
        while i <= imax && reset == 0
            k = 0        
            repe = 0          
            while k <= imax && repe < 2
                if array_order[i][idkey] == array_order[k][idkey]
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                array_order.delete_at(k)
                reset += 1
            end                  
            i += 1
        end          
        if i == array_order.count
            reset_principal += 1
        end    
    end
    return array_order    
  end



  def array_gruposdetrabajo
    gruposdetrabajos = Groupsofwork.where('activo = ?','Si')
    array_gruposdetrabajo = []
    gruposdetrabajos.each do |gruposdetrabajo|      
      gruposdetrabajo_nombre = "#{gruposdetrabajo.sector.descripcion} - #{gruposdetrabajo.subsector.descripcion} - #{gruposdetrabajo.chiefoffront.entity.nombre} #{gruposdetrabajo.chiefoffront.entity.apellido} #{gruposdetrabajo.chiefoffront.entity.razon_social} - #{gruposdetrabajo.subcontract.supplier.entity.nombre} #{gruposdetrabajo.subcontract.supplier.entity.apellido} #{gruposdetrabajo.subcontract.supplier.entity.razon_social} - #{gruposdetrabajo.teacherofwork.entity.nombre} #{gruposdetrabajo.teacherofwork.entity.apellido} #{gruposdetrabajo.teacherofwork.entity.razon_social}"
      gruposdetrabajo_id = gruposdetrabajo.id
      array_gruposdetrabajo << [gruposdetrabajo_nombre,gruposdetrabajo_id]
    end
    @array_gruposdetrabajo = filtra_array_uno(1,array_gruposdetrabajo)      
  end

def rango_de_dias_habiles(inicio, fin)
    inicio = inicio.to_date
    fin = fin.to_date
    dias_habiles = []
    #business_days = 0
    #dates = date2
    while fin >= inicio
      #business_days = business_days + 1 unless dates.sunday?
      dias_habiles << inicio.strftime("%Y-%m-%d")
      inicio = inicio + 1.day
    end
    return dias_habiles
end



def tareo_guardar
    @tareo = Tareo.new(params[:tareo])
    inicio = params[:tareo][:inicio].to_date    
    fin = params[:tareo][:fin].to_date
    dias_habiles = rango_de_dias_habiles(inicio,fin)
    dias_habiles.each do |dia|
      @partediariodepersonals = Partediariodepersonal.where('fecha = ?',dia)
      @partediariodepersonals.each do |partediariodepersonal|
        partediariodepersonal.update_attributes(:aprobado => 1)
      end
    end
    @tareo.save
    redirect_to tareos_path    
end


def tareo_semanal
  # array subcontratos filtrados
    @array_gruposdetrabajo = array_gruposdetrabajo


    if params[:gruposdetrabajo_id].nil? && params[:inicio].nil? && params[:fin].nil?
      @pase = 0



    else
      @gruposdetrabajo_id     = params[:gruposdetrabajo_id]      
      @inicio             = params[:inicio]      
      @fin                = params[:fin]

      if @gruposdetrabajo_id.present? && @inicio.present? && @fin.present?
        @dias_habiles =  rango_de_dias_habiles(@inicio,@fin)
        @trabajadores_array = tareo_array(@inicio,@fin,@gruposdetrabajo_id,@dias_habiles)        
        gruposdetrabajo = Gruposdetrabajo.find_by_id(@gruposdetrabajo_id)
        @subcontratista_nombre = "#{gruposdetrabajo.sectore.descripcion} - #{gruposdetrabajo.subsectore.descripcion} - #{gruposdetrabajo.jefedefrente.ente.nombre} #{gruposdetrabajo.jefedefrente.ente.apellido} #{gruposdetrabajo.jefedefrente.ente.razon_social} - #{gruposdetrabajo.subcontrato.proveedore.ente.nombre} #{gruposdetrabajo.subcontrato.proveedore.ente.apellido} #{gruposdetrabajo.subcontrato.proveedore.ente.razon_social} - #{gruposdetrabajo.maestrodeobra.ente.nombre} #{gruposdetrabajo.maestrodeobra.ente.apellido} #{gruposdetrabajo.maestrodeobra.ente.razon_social}"
        if @trabajadores_array.length != 0
          if @dias_habiles.length == 0
            @pase = 3
          else
            @pase = 1
          end
        else
          @pase = 2
        end




      elsif @gruposdetrabajo_id.blank? && @inicio.present? && @fin.present?        
        @dias_habiles =  rango_de_dias_habiles(@inicio,@fin)
        gruposdetrabajos = Groupsofwork.all
        @tareos_total_arrays = []
        @subcontratista_arrays = []
        gruposdetrabajos.each do |gruposdetrabajo|
          temp_tareo = []
          temp_tareo = tareo_array(@inicio,@fin,gruposdetrabajo.id,@dias_habiles)          
          if temp_tareo.length != 0 
            @tareos_total_arrays << temp_tareo
            subcontratista = Subcontract.find_by_id(gruposdetrabajo.subcontract_id) 
            subcontratista_nombre = "#{gruposdetrabajo.sector.descripcion} - #{gruposdetrabajo.subsector.descripcion} - #{gruposdetrabajo.chiefoffront.entity.nombre} #{gruposdetrabajo.chiefoffront.entity.apellido} #{gruposdetrabajo.chiefoffront.entity.razon_social} - #{gruposdetrabajo.subcontract.supplier.entity.nombre} #{gruposdetrabajo.subcontract.supplier.entity.apellido} #{gruposdetrabajo.subcontract.supplier.entity.razon_social} - #{gruposdetrabajo.teacherofwork.entity.nombre} #{gruposdetrabajo.teacherofwork.entity.apellido} #{gruposdetrabajo.teacherofwork.entity.razon_social}"        
            @subcontratista_arrays << subcontratista_nombre
          end
        end




        if @dias_habiles.length == 0
          @pase = 3
        else
          if @tareos_total_arrays.length != 0
            @pase = 4
          else
            @pase = 2
          end
        end




      else 
        @pase = 3
      end
    end
end





  def aprobar
      @tareo = Tareo.find(params[:id])
      @tareo.update_attributes(:aprobado => 1)
      redirect_to tareos_path
  end

  def desaprobar
      @tareo = Tareo.find(params[:id])
      @tareo.update_attributes(:aprobado =>'')
      redirect_to tareos_path
  end


  private
  def tareo_parameters
    params.require(:tareo).permit(:inicio, :fin, :aprobado, :tareosgruposdetrabajos_attributes)
  end


end
