class Production::ValuationsController < ApplicationController
  def generar    
  end

  def index
    @valuations = Valuation.all
    respond_to do |format|
      format.html
      format.json { render json: @valuations }
    end
  end

  def valorizacion_aprobar
    @valuation = Valuation.find(params[:id])
    @valuation.update_attributes(params[:valuation])
    redirect_to "/valuations"
  end

  def show
    @valuation = Valuation.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @valuation }
    end
  end

  def new
    @valuation = Valuation.new
    respond_to do |format|
      format.html
      format.json { render json: @valuation }
    end
  end

  def edit
    @valuation = Valuation.find(params[:id])
  end

  def create
    @valuation = Valuation.new(params[:valuation])
    respond_to do |format|
      if @valuation.save
        format.html { redirect_to @valuation, notice: 'valuation was successfully created.' }
        format.json { render json: @valuation, status: :created, location: @valuation }
      else
        format.html { render action: "new" }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @valuation = Valuation.find(params[:id])

    respond_to do |format|
      if @valuation.update_attributes(params[:valuation])
        format.html { redirect_to @valuation, notice: 'valuation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @valuation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @valuation = Valuation.find(params[:id])
    inicio = @valuation.fecha_inicial.to_date
    fin    = @valuation.fecha_fin.to_date

    dias_habiles = rango_de_dias_habiles(inicio,fin)
    dias_habiles.each do |dia|
      @parteobras = Parteobra.where('fecha = ?',dia)
      @parteobras.each do |parteobra|
        parteobra.update_attributes(:aprobado => '')
      end
    end

    @valuation.destroy

    respond_to do |format|
      format.html { redirect_to valuations_url }
      format.json { head :no_content }
    end
  end

  def funcion_partidas2(a)
      # [0]           id                  lista
      # [1]           nombre              lista
      # [2]           unidad              lista
      # [3]           metrado             partida
      # [4]           precio_unitario     lista
      # [5]           parcial             multiplicacion
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = a.count - 1
        reset = 0              
        while i <= imax && reset == 0
            k = 0        
            repe = 0          
            while k <= imax && repe < 2
                if a[i][0] == a[k][0]                          
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                a[i][3] += a[k][3]
                a[i][5] += a[k][5]
                a.delete_at(k)
                reset += 1                      
            end                  
            i += 1
        end          
        if i == a.count
            reset_principal += 1
        end    
    end
    return a
  end

  def funcion_partidas(partidas)
    a = []
    partidas.each do |partida|
      # [0]           id                  lista
      # [1]           nombre              lista
      # [2]           unidad              lista
      # [3]           metrado             partida
      # [4]           precio_unitario     lista
      # [5]           parcial             multiplicacion
      # [6]           codigo              lista
      temp1 = List.where('id = ?', partida.list_id)         
      a << [temp1[0]['id'],temp1[0]['nombre'],temp1[0]['unidad'],partida['metrado'].to_f,temp1[0]['precio_unitario'].to_f,(temp1[0]['precio_unitario'].to_f * partida['metrado'].to_f),temp1[0]['codigo']]
    end          

    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = a.count - 1
        reset = 0              
        while i <= imax && reset == 0
            k = 0        
            repe = 0          
            while k <= imax && repe < 2
                if a[i][0] == a[k][0]
                    repe += 1
                end
                k += 1
            end
            if repe == 2
                k = k - 1
                a[i][3] += a[k][3]
                a[i][5] += a[k][5]
                a.delete_at(k)
                reset += 1
            end
            i += 1
        end
        if i == a.count
            reset_principal += 1
        end
    end
    return a
  end


  def funcion_manodeobras2(manodeobras)
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = manodeobras.count - 1
        reset = 0              
        while i <= imax && reset == 0
            k = 0        
            repe = 0          
            while k <= imax && repe < 2
                if manodeobras[i][1] == manodeobras[k][1]                          
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                manodeobras[i][3] += manodeobras[k][3]
                manodeobras[i][4] += manodeobras[k][4]
                manodeobras[i][5] += manodeobras[k][5]
                manodeobras[i][9] += manodeobras[k][9]
                manodeobras[i][10] += manodeobras[k][10]
                manodeobras[i][11] += manodeobras[k][11]
                manodeobras.delete_at(k)
                reset += 1                      
            end                  
            i += 1
        end          
        if i == manodeobras.count
            reset_principal += 1
        end    
    end    
    return manodeobras
  end
  def funcion_manodeobras(trabajadores)
    # definimos la matriz que organizara todo
    manodeobras = []

    # formamos la matriz operativa catalogocategoriatrabajadore
    trabajadores.each do |trabajadore|
       #temp1 = CatalogocategoriaWorker.where('id = ?', Worker.catalogocategoriatrabajadore_id)
      #temp2 = Unidade.where('id = ?', temp1[0]['unidade_id'])

      id                        =       trabajadore.catalogofwork.id
      tipo_id                   =       trabajadore.catalogofwork.catalogcategorywork.id
      tipo_nombre               =       trabajadore.catalogofwork.catalogcategorywork.nombre
      cantidad_normal           =       trabajadore.normal.to_f.blank? ? 0.00 : trabajadore.normal.to_f
      cantidad_60               =       trabajadore.normal_60.to_f.blank? ? 0.00 : trabajadore.normal_60.to_f
      cantidad_100              =       trabajadore.normal_100.to_f.blank? ? 0.00 : trabajadore.normal_100.to_f
      precio_unitario_normal    =       trabajadore.catalogofwork.catalogcategorywork.precio_unitario_normal.to_f
      precio_unitario_60        =       trabajadore.catalogofwork.catalogcategorywork.precio_unitario_60.to_f
      precio_unitario_100       =       trabajadore.catalogofwork.catalogcategorywork.precio_unitario_100.to_f
      parcial_normal            =       cantidad_normal * precio_unitario_normal
      parcial_60                =       cantidad_60 * precio_unitario_60
      parcial_100               =       cantidad_100 * precio_unitario_100
      unidad                    =       trabajadore.catalogofwork.catalogcategorywork.unit.nombre
      manodeobras << [id,tipo_id,tipo_nombre,cantidad_normal,cantidad_60,cantidad_100,precio_unitario_normal,precio_unitario_60, precio_unitario_100,parcial_normal,parcial_60,parcial_100,unidad]


    end  
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = manodeobras.count - 1
        reset = 0              
        while i <= imax && reset == 0
            k = 0        
            repe = 0          
            while k <= imax && repe < 2
                if manodeobras[i][1] == manodeobras[k][1]                          
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                manodeobras[i][3] += manodeobras[k][3]
                manodeobras[i][4] += manodeobras[k][4]
                manodeobras[i][5] += manodeobras[k][5]
                manodeobras[i][9] += manodeobras[k][9]
                manodeobras[i][10] += manodeobras[k][10]
                manodeobras[i][11] += manodeobras[k][11]
                manodeobras.delete_at(k)
                reset += 1                      
            end                  
            i += 1
        end          
        if i == manodeobras.count
            reset_principal += 1
        end    
    end    
    return manodeobras
  end

  def funcion_equipos2(equipos)
    # empiesa la programacion
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = equipos.count - 1
        reset = 0              
        while i <= imax && reset == 0
            k = 0
            repe = 0
            while k <= imax && repe < 2
                if equipos[i][0] == equipos[k][0]                          
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                equipos[i][3] += equipos[k][3]
                equipos[i][6] += equipos[k][6]
                equipos.delete_at(k)
                reset += 1
            end                  
            i += 1
        end          
        if i == equipos.count
            reset_principal += 1
        end    
    end
    return equipos
  end

  def funcion_equipos_frente(fecha_inicio, fecha_fin, gruposdetrabajos)
    ## equipos   
    equipos = []
    equiposregistrados = []
    partedeequipos = Partofequipment.where('fecha BETWEEN ? and ?', fecha_inicio, fecha_fin)
    partedeequipos.each do |partedeequipo|
      equiposdesubcontratos = Equiposdesubcontrato.where('id = ?', partedeequipo['equiposdesubcontrato_id'])
      subcontratodeequipos = Subcontratodeequipo.where('id = ?', partedeequipo['subcontratodeequipo_id'])
      proveedores = Supplier.where('id = ?',subcontratodeequipos[0]['proveedore_id'])
      entes = Ente.where('id = ?', proveedores[0]['ente_id'])
      insumodeequipos = Insumodeequipo.where('id = ?', equiposdesubcontratos[0]['insumodeequipo_id'])
      gruposdetrabajos.each do |gdt|
        equiposregistrados = Equiposregistrado.where('partedeequipo_id = ? and groupsofwork_id = ? and front_id = ?',partedeequipo['id'], gdt['id'], @frente_id)
        id = insumodeequipos[0]['id']
        nombre = insumodeequipos[0]['nombre']
        subcontratodeequipo = entes[0]['nombre'] + entes[0]['apellido'] + entes[0]['razon_social']
        equiposregistrados.each do |equiposregistrado|          
          cantidad = equiposregistrado['cantidad'].to_f          
          unidad = equiposregistrado.partedeequipo.equiposdesubcontrato.unidade.nombre
          precio_unitario = equiposdesubcontratos[0]['precion_sin_igv'].to_f
          parcial = cantidad * precio_unitario
          equipos << [id,nombre,subcontratodeequipo,cantidad,unidad,precio_unitario,parcial]
        end
      end
    end
    # empiesa la programacion
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = equipos.count - 1
        reset = 0              
        while i <= imax && reset == 0
            k = 0
            repe = 0
            while k <= imax && repe < 2
                if equipos[i][0] == equipos[k][0]                          
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                equipos[i][3] += equipos[k][3]
                equipos[i][6] += equipos[k][6]
                equipos.delete_at(k)
                reset += 1
            end                  
            i += 1
        end          
        if i == equipos.count
            reset_principal += 1
        end    
    end

    return equipos  
  end


  def funcion_equipos(fecha_inicio, fecha_fin, gruposdetrabajos)
    ## equipos   
    equipos = []
    equiposregistrados = []


    partedeequipos = Partofequipment.where('fecha BETWEEN ? and ?', fecha_inicio, fecha_fin)
    partedeequipos.each do |partedeequipo|
      equiposdesubcontratos = Equipmentsofsubcontract.where('id = ?', partedeequipo['equiposdesubcontrato_id'])
      subcontratodeequipos = Subcontratodeequipo.where('id = ?', partedeequipo['subcontratodeequipo_id'])
      proveedores = Supplier.where('id = ?',subcontratodeequipos[0]['proveedore_id'])
      entes = Ente.where('id = ?', proveedores[0]['ente_id'])
      insumodeequipos = Inputofequipment.where('id = ?', equiposdesubcontratos[0]['inputofequipment_id'])

      gruposdetrabajos.each do |gdt|
        equiposregistrados = Equiposregistrado.where('partedeequipo_id = ? and groupsofwork_id = ? ',partedeequipo['id'], gdt['id'])
        id = equiposdesubcontratos[0]['id']
        nombre = "(#{equiposdesubcontratos[0]['codigo']}) #{insumodeequipos[0]['nombre']}" 
        subcontratodeequipo = entes[0]['nombre'] + entes[0]['apellido'] + entes[0]['razon_social']        
        equiposregistrados.each do |equiposregistrado|
          cantidad = equiposregistrado['cantidad'].to_f          
          unidad = equiposregistrado.partedeequipo.equiposdesubcontrato.unidade.nombre
          precio_unitario = equiposdesubcontratos[0]['precion_sin_igv'].to_f
          parcial = cantidad * precio_unitario



          equipos << [id,nombre,subcontratodeequipo,cantidad,unidad,precio_unitario,parcial]
        end
      end
    end

    # empiesa la programacion
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = equipos.count - 1
        reset = 0              
        while i <= imax && reset == 0
            k = 0
            repe = 0
            while k <= imax && repe < 2
                if equipos[i][0] == equipos[k][0]                          
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                equipos[i][3] += equipos[k][3]
                equipos[i][6] += equipos[k][6]
                equipos.delete_at(k)
                reset += 1
            end                  
            i += 1
        end          
        if i == equipos.count
            reset_principal += 1
        end    
    end


    return equipos  

  end

  def produccion_fecha

    # ninguna de las opciones
    if params[:front_id].nil? && params[:chiefoffront_id].nil? && params[:suconctract_id].nil? && params[:teacherofwork_id].nil? && params[:fecha_inicio].nil? && params[:fecha_fin].nil?

      @gruposdetrabajos = 'no estan definidos'

    # Aca empieza todas las consultas todos estan minimo vacios
    else
      frente_id         = params[:front_id]
      jefedefrente_id   = params[:chiefoffront_id]
      subcontrato_id    = params[:subcontract_id]
      maestrodeobra_id  = params[:teacherofwork_id]
      fecha_inicio      = params[:fecha_inicio]
      fecha_fin         = params[:fecha_fin]

      @frente_id         = params[:front_id]
      @jefedefrente_id   = params[:chiefoffront_id] 
      @subcontrato_id    = params[:subcontract_id]
      @maestrodeobra_id  = params[:teacherofwork_id]
      @fecha_inicio      = params[:fecha_inicio]
      @fecha_fin         = params[:fecha_fin]
      
      if fecha_inicio.blank? && fecha_fin.blank?
        @gruposdetrabajos = 'No estan las fechas'

      else        
        @parteobras = []  # definimos un parteobras general
        partidas   = []  # definimos las partidas generales
        partediariodepersonals = [] # definimos el partediario de personal vacio
        trabajadores  = []
        @temp = []    # para sacar pruebas
        
        # ninguno marcado
        if frente_id.blank? && jefedefrente_id.blank? && subcontrato_id.blank? && maestrodeobra_id.blank?
          @gruposdetrabajos = Groupsofwork.where('activo = ?','Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)
          

        # frente
        elsif frente_id.present? && jefedefrente_id.blank? && subcontrato_id.blank? && maestrodeobra_id.blank?
          #@gruposdetrabajos = Groupsofwork.where("front_id = ? and activo = ?", frente_id, 'Si').order('id Asc')                   
          #@gruposdetrabajos.each do |gdt|
          #  @parteobras += Parteobra.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          #  partediariodepersonals += Partediariodepersonal.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          #end 

          #@parteobras.each {|parteobra| partidas += Partida.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          #partediariodepersonals.each{|partediariodepersonal| trabajadores += Trabajadore.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          #@a = funcion_partidas(partidas)
          #@manodeobras = funcion_manodeobras(trabajadores)
          #@equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)
          parteobras = Partwork.where('front_id = ? and date(fecha) BETWEEN ? AND ?', @frente_id, @fecha_inicio, @fecha_fin)
          @temp_array = []
          partidas = []
          parteobras.each do |parteobra|
            parteobra.items.each do |partida|
              id = partida.list.id
              nombre = partida.list.nombre
              unidad = partida.list.unit.nombre
              metrado = partida.metrado
              precio_unitario = partida.list.precio_unitario
              parcial = precio_unitario.to_f * metrado.to_f
              codigo = partida.list.codigo
              partidas << [id,nombre,unidad,metrado,precio_unitario,parcial,codigo]
            end             
          end

          partediariodepersonals = Partdayliofperson.where('date(fecha) BETWEEN ? AND ?', @fecha_inicio, @fecha_fin)
          trabajadores = []
          manodeobras = []
          partediariodepersonals.each do |partediariodepersonal|
            partediariodepersonal.workers.each do |trabajadore|
              if trabajadore.front_id == @frente_id.to_i
                id                        =       trabajadore.catalogofwork.id
                tipo_id                   =       trabajadore.catalogofwork.catalogcategorywork.id
                tipo_nombre               =       trabajadore.catalogofwork.catalogcategorywork.nombre
                cantidad_normal           =       trabajadore.normal.to_f.blank? ? 0.00 : trabajadore.normal.to_f
                cantidad_60               =       trabajadore.normal_60.to_f.blank? ? 0.00 : trabajadore.normal_60.to_f
                cantidad_100              =       trabajadore.normal_100.to_f.blank? ? 0.00 : trabajadore.normal_100.to_f
                precio_unitario_normal    =       trabajadore.catalogofwork.catalogcategorywork.precio_unitario_normal.to_f
                precio_unitario_60        =       trabajadore.catalogofwork.catalogcategorywork.precio_unitario_60.to_f
                precio_unitario_100       =       trabajadore.catalogofwork.catalogcategorywork.precio_unitario_100.to_f
                parcial_normal            =       cantidad_normal * precio_unitario_normal
                parcial_60                =       cantidad_60 * precio_unitario_60
                parcial_100               =       cantidad_100 * precio_unitario_100
                unidad                    =       trabajadore.catalogofwork.catalogcategorywork.unit.nombre
                manodeobras << [id,tipo_id,tipo_nombre,cantidad_normal,cantidad_60,cantidad_100,precio_unitario_normal,precio_unitario_60, precio_unitario_100,parcial_normal,parcial_60,parcial_100,unidad]
              end              
            end             
          end


          partedeequipos = Partofequipment.where('fecha BETWEEN ? and ?',@fecha_inicio,@fecha_fin)
          equipos = []
          partedeequipos.each do |partedeequipo|
            partedeequipo.equiposregistrados.each do |equiposregistrado|
              id = equiposregistrado.partedeequipo.equiposdesubcontrato.insumodeequipo.id 
              nombre = equiposregistrado.partedeequipo.equiposdesubcontrato.insumodeequipo.nombre  
              subcontratodeequipo = "#{equiposregistrado.partedeequipo.subcontratodeequipo.proveedore.ente.nombre} #{equiposregistrado.partedeequipo.subcontratodeequipo.proveedore.ente.apellido} #{equiposregistrado.partedeequipo.subcontratodeequipo.proveedore.ente.razon_social}"
              cantidad = equiposregistrado.cantidad.to_f          
              unidad = equiposregistrado.partedeequipo.equiposdesubcontrato.unidade.nombre
              precio_unitario = equiposregistrado.partedeequipo.equiposdesubcontrato.precion_sin_igv.to_f
              parcial = cantidad * precio_unitario              
              equipos << [id,nombre,subcontratodeequipo,cantidad,unidad,precio_unitario,parcial]
            end
          end

          @manodeobras  = funcion_manodeobras2(manodeobras)          
          @a            = funcion_partidas2(partidas)          
          @equipos      = funcion_equipos2(equipos)


        # jefedefrente
        elsif frente_id.blank? && jefedefrente_id.present? && subcontrato_id.blank? && maestrodeobra_id.blank?
          @gruposdetrabajos = Groupsofwork.where("chiefoffront_id =  ? and activo = ?", jefedefrente_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)   
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)
          

        # subcontrato
        elsif frente_id.blank? && jefedefrente_id.blank? && subcontrato_id.present? && maestrodeobra_id.blank?
          @gruposdetrabajos = Groupsofwork.where("subcontract_id = ? and activo = ?", subcontrato_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # maestrodeobra
        elsif frente_id.blank? && jefedefrente_id.blank? && subcontrato_id.blank? && maestrodeobra_id.present? 
          @gruposdetrabajos = Groupsofwork.where("teacherofwork_id = ? and activo = ?", maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)


        # frente jefedefrente
        elsif frente_id.present? && jefedefrente_id.present? && subcontrato_id.blank? && maestrodeobra_id.blank?

          @gruposdetrabajos = Groupsofwork.where('chiefoffront_id =  ? and activo = ?', jefedefrente_id, 'Si')
          @gruposdetrabajos.each do |gruposdetrabajo|            
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ? and front_id = ?', gruposdetrabajo['id'], fecha_inicio, fecha_fin, frente_id)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gruposdetrabajo['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ? and front_id = ?',partediariodepersonal['id'], frente_id)}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos_frente(fecha_inicio,fecha_fin,@gruposdetrabajos)





        # frente subcontrato
        elsif frente_id.present? && jefedefrente_id.blank? && subcontrato_id.present? && maestrodeobra_id.blank?
          @gruposdetrabajos = Groupsofwork.where('subcontract_id = ? and activo = ?', subcontrato_id, 'Si')          
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ? and front_id = ?', gdt['id'],fecha_inicio,fecha_fin,frente_id)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ? and front_id = ?',partediariodepersonal['id'], frente_id)}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos_frente(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # frente maestrodeobra
        elsif frente_id.present? && jefedefrente_id.blank? && subcontrato_id.blank? && maestrodeobra_id.present?
          @gruposdetrabajos = Groupsofwork.where('teacherofwork_id = ? and activo = ?', maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ? and front_id = ?', gdt['id'], fecha_inicio, fecha_fin, frente_id)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ? and front_id = ?',partediariodepersonal['id'],frente_id)}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos_frente(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # jefedefrente subcontrato
        elsif frente_id.blank? && jefedefrente_id.present? && subcontrato_id.present? && maestrodeobra_id.blank?
          @gruposdetrabajos = Groupsofwork.where('chiefoffront_id =  ? and subcontract_id = ? and activo = ?', jefedefrente_id, subcontrato_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # jefedefrente maestrodeobra
        elsif frente_id.blank? && jefedefrente_id.present? && subcontrato_id.blank? && maestrodeobra_id.present?
          @gruposdetrabajos = Groupsofwork.where('chiefoffront_id =  ? and teacherofwork_id = ? and activo = ?', jefedefrente_id, maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # subcontrato maestrodeobra
        elsif frente_id.blank? && jefedefrente_id.blank? && subcontrato_id.present? && maestrodeobra_id.present?
          @gruposdetrabajos = Groupsofwork.where('subcontract_id = ? and teacherofwork_id = ? and activo = ?', subcontrato_id, maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # frente jefedefrente subcontrato
        elsif frente_id.present? && jefedefrente_id.present? && subcontrato_id.present? && maestrodeobra_id.blank?          
          @gruposdetrabajos = Groupsofwork.where('chiefoffront_id =  ? and subcontract_id = ? and activo = ?', jefedefrente_id, subcontrato_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ? and front_id = ?', gdt['id'], fecha_inicio, fecha_fin, frente_id)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ? and front_id = ?',partediariodepersonal['id'], frente_id)}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos_frente(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # jefedefrente subcontrato maestrodeobra
        elsif frente_id.blank? && jefedefrente_id.present? && subcontrato_id.present? && maestrodeobra_id.present?
          @gruposdetrabajos = Groupsofwork.where('chiefoffront_id =  ? and subcontract_id = ? and teacherofwork_id = ? and activo = ?', jefedefrente_id, subcontrato_id, maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # frente jefedefrente maestrodeobra
        elsif frente_id.present? && jefedefrente_id.present? && subcontrato_id.blank? && maestrodeobra_id.present?
          @gruposdetrabajos = Groupsofwork.where('chiefoffront_id =  ? and teacherofwork_id = ? and activo = ?',jefedefrente_id, maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ? and front_id = ?', gdt['id'], fecha_inicio, fecha_fin,frente_id)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ? and front_id = ?',partediariodepersonal['id'], frente_id)}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos_frente(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # frente subcontrato maestrodeobra
        elsif frente_id.present? && jefedefrente_id.blank? && subcontrato_id.present? && maestrodeobra_id.present?
          @gruposdetrabajos = Groupsofwork.where('subcontract_id = ? and teacherofwork_id = ? and activo = ?', subcontrato_id, maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ? and front_id = ?', gdt['id'], fecha_inicio, fecha_fin, frente_id)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ? and front_id = ?',partediariodepersonal['id'],frente_id)}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos_frente(fecha_inicio,fecha_fin,@gruposdetrabajos)

        # frente jefedefrente subcontrato maestrodeobra
        elsif frente_id.present? && jefedefrente_id.present? && subcontrato_id.present? && maestrodeobra_id.present? 
          @gruposdetrabajos = Groupsofwork.where("chiefoffront_id =  ? and subcontract_id = ? and teacherofwork_id = ? and activo = ?", jefedefrente_id, subcontrato_id, maestrodeobra_id, 'Si')
          @gruposdetrabajos.each do |gdt|
            @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ? and front_id = ?', gdt['id'], fecha_inicio, fecha_fin, frente_id)
            partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], fecha_inicio, fecha_fin)
          end
          @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}          
          partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ? and front_id = ?',partediariodepersonal['id'], frente_id)}
          @a = funcion_partidas(partidas)
          @manodeobras = funcion_manodeobras(trabajadores)
          @equipos = funcion_equipos_frente(fecha_inicio,fecha_fin,@gruposdetrabajos)
        end  



        # suma de todos los elementos       
        
               

        @count_partidas = @a.count
        @count_manodeobras = @manodeobras.count
        @count_equipos = @equipos.count
        
        @partidas_suma = 0
        if @count_partidas > 0
          @a.each{|partida| @partidas_suma += partida[5] }
        end
        @partidas_suma = @partidas_suma.round(2)

        @manodeobras_suma = 0
        if @count_manodeobras > 0
          @manodeobras.each{|manodeobra| @manodeobras_suma += manodeobra[9] + manodeobra[10] + manodeobra[11] }
          @manodeobras_suma = @manodeobras_suma.round(2)
        end

        @equipos_suma = 0 
        if @count_equipos > 0              
          @equipos.each{|equipo| @equipos_suma += equipo[6] }  
          @equipos_suma = @equipos_suma.round(2)        
        end

        @diferencia = (@partidas_suma - @manodeobras_suma - @equipos_suma)
        
        
      end

    end
  end

  def valorizacion_uno
    gruposdetrabajos = Groupsofwork.where('activo = ?','Si')
    array_subcontratos = []
    gruposdetrabajos.each do |gruposdetrabajo|
      subcontrato = Subcontract.find_by_id(gruposdetrabajo['subcontract_id'])
      proveedore = Supplier.find_by_id(subcontrato['supplier_id'])
      ente = Entity.find_by_id(proveedore['entity_id'])
      subcontrato_nombre = "#{ente['nombre']}  #{ente['apellido']} #{ente['razon_social']}"
      array_subcontratos << [subcontrato_nombre,subcontrato['id']]
    end

    # empiesa la programacion
    reset_principal = 0
    while reset_principal == 0
        i = 0
        imax = array_subcontratos.count - 1
        reset = 0
        while i <= imax && reset == 0
            k = 0        
            repe = 0          
            while k <= imax && repe < 2
                if array_subcontratos[i][1] == array_subcontratos[k][1]
                    repe += 1                          
                end
                k += 1
            end
            if repe == 2                      
                k = k - 1 
                array_subcontratos.delete_at(k)
                reset += 1
            end                  
            i += 1
        end          
        if i == array_subcontratos.count
            reset_principal += 1
        end    
    end
    @array_subcontratos = array_subcontratos

    if params[:subcontract_id].nil? && params[:fecha_inicio].nil? && params[:fecha_fin].nil?
      # si no estan enviados los parametros primera carga
      @pase = 0
    else
      @subcontrato_id    = params[:subcontract_id]

      # 1.- Fecha Inicial
      # ===========================================================
      @fecha_inicio      = params[:fecha_inicio]
      @fecha_inicial     = @fecha_inicio

      # 2.- Fecha Final
      # ===========================================================
      @fecha_fin         = params[:fecha_fin]

      @pase = 0

      if @fecha_inicio.blank? && @fecha_fin.blank?
        # si fecha inicio y fin estan en blanco  
        @pase = 0
      elsif @fecha_inicio.blank? && @fecha_fin.present?
        @pase = 0
      elsif @fecha_inicio.present? && @fecha_fin.blank?
        @pase = 0
      elsif @fecha_inicio.present? && @fecha_fin.present? && @subcontrato_id.blank?
        @pase = 4
      else
          @valorize_actual = Valuation.where('subcontract_id = ?',@subcontrato_id).order('id Desc')
          @valorize_estado = 0
          if @valorize_actual.count != 0
            if @valorize_actual[0].fecha_fin.to_time < @fecha_inicio.to_time               
              @valorize_estado = 1 
              @pase = 1
            else
              @error_fecha_fin = @valorize_actual[0].fecha_fin
              @valorize_estado = 0
              @pase = 3
            end
          else
            @valorize_estado = 1
            @pase = 1
          end

          if @valorize_estado == 1

                # aca recien empieza a acer todas las consultas
                if @subcontrato_id.blank?
                  # si subcontrato esta en blanco
                  @pase = 0
                else
                  # si subcontrato existe         


                  #activa si va salir algo en pantalla
                  @pase = 1                  
                  @subcontrato = Subcontract.find_by_id(@subcontrato_id)

                  parteobras = []
                  partediariodepersonals = []
                  partidas = []
                  trabajadores = []

                  @gruposdetrabajos = Groupsofwork.where('subcontract_id = ? and activo = ?', @subcontrato_id, 'Si')
                  @gruposdetrabajos.each do |gdt|
                    parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], @fecha_inicio, @fecha_fin)
                    partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], @fecha_inicio, @fecha_fin)
                  end
                  parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}
                  partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}

                  @partidas = funcion_partidas(partidas)
                  @manodeobras = funcion_manodeobras(trabajadores)
                  @equipos = funcion_equipos(@fecha_inicio,@fecha_fin,@gruposdetrabajos)

                  @equipodays = []
                  @equipos.each do |equipo|
                    @equipodays << matriz_maquinaria(@fecha_inicio,@fecha_fin,equipo[0])                    
                  end

                  #@equipodays = matriz_maquinaria(@fecha_inicio,@fecha_fin,params[:equiposdesubcontrato_id])

                  if !@partidas.nil? 
                    @count_partidas = @partidas.count
                    @count_manodeobras = @manodeobras.count
                    @count_equipos = @equipos.count

                    # 37.- Actual_fondo_garantia_dos 
                    # =======================================================================================
                    @actual_fondo_garantia_dos = 0
                    if @count_manodeobras > 0              
                      @manodeobras.each{|manodeobra| @actual_fondo_garantia_dos += manodeobra[9] + manodeobra[10] + manodeobra[11] }
                      @actual_fondo_garantia_dos = @actual_fondo_garantia_dos.round(2)
                    end

                    # 40.- Actual_descuento_de_equipos
                    # =======================================================================================
                    @actual_descuento_de_equipos = 0
                    if @count_equipos > 0
                      @actual_descuento_de_equipos = 0
                      @equipos.each{|equipo| @actual_descuento_de_equipos += equipo[6] }
                      @actual_descuento_de_equipos = @actual_descuento_de_equipos.round(2)
                    end

                      if params[:cheked_count_descuento_de_equipos].nil?
                        @cheked_count_descuento_de_equipos = 1
                      else                        
                        if !params[:checkbox_descuento_de_equipos].nil?
                          @cheked_count_descuento_de_equipos = 1
                        else
                          @cheked_count_descuento_de_equipos = 0
                        end
                      end
                      
                      if @cheked_count_descuento_de_equipos == 0
                        @actual_descuento_de_equipos = 0.00
                      end
                    
                    if @count_partidas > 0

                      # consulta los acumulados anteriores
                      acumulados = Valuation.where("valorizacione_subcontrato_id = ?",@subcontrato_id).last
                      if !acumulados.nil?
                        # 10.2 Acumulado_actual_valorizacion_actual
                        @acumulado_anterior_valorizacion_actual = acumulados.acumulado_actual_valorizacion_actual.to_f
                        # 14.2 Acumulado_anterior_amortizacion_numero
                        @acumulado_anterior_amortizacion_numero = acumulados.acumulado_actual_amortizacion_numero.to_f
                        # 17.2 .- Acumulado_anterior_total
                        @acumulado_anterior_total = acumulados.acumulado_actual_total.to_f
                        # 21.2 .- Acumulado_anterior_igv_numero
                        @acumulado_anterior_igv_numero = acumulados.acumulado_actual_igv_numero.to_f
                        # 24.2 .- Acumulado_anterior_total_incluido_igv
                        @acumulado_anterior_total_incluido_igv = acumulados.acumulado_actual_total_incluido_igv.to_f
                        # 27.2 .- Acumulado_anterior_retenciones
                        @acumulado_anterior_retenciones = acumulados.acumulado_actual_retenciones.to_f
                        # 31.2 Acumulado_anterior_detraccion_del_total_numero
                        @acumulado_anterior_detraccion_del_total_numero = acumulados.acumulado_actual_detraccion_del_total_numero.to_f
                        # 35.2.- Acumulado_anterior_fondo_garantia_uno_numero
                        @acumulado_anterior_fondo_garantia_uno_numero = acumulados.acumulado_actual_fondo_garantia_uno_numero.to_f
                        # 38.2 .- Acumulado_anterior_fondo_garantia_dos
                        @acumulado_anterior_fondo_garantia_dos = acumulados.acumulado_actual_fondo_garantia_dos.to_f
                        # 41.2 Acumulado_anterior_descuento_de_equipos
                        @acumulado_anterior_descuento_de_equipos = acumulados.acumulado_actual_descuento_de_equipos.to_f
                        # 47.2 .- Acumulado_anterior_neto_pagar
                        @acumulado_anterior_neto_pagar = acumulados.acumulado_actual_neto_pagar.to_f
                        # 50.2.- valorizacione_contador
                        @valorizacione_contador = acumulados.valorizacione_contador.to_i + 1
                        # 53.1.- Acumulado_anterior_descuento_otros
                        @acumulado_anterior_descuento_otros = acumulados.acumulado_actual_descuento_otros.to_f
                        # =======================================================================================            
                        

                        # pase acumulado_anterior si existe
                        @acumulado_anterior_pase = 1
                        @acumulado_anterior_subcotratista_nombre = acumulados.subcontratista_nombre
                        @acumulado_anterior_fecha_inicial = acumulados.fecha_inicial
                        @acumulado_anterior_fecha_fin = acumulados.fecha_fin
                      else
                        # 10.1 Acumulado_anterior_valorizacion_actual
                        @acumulado_anterior_valorizacion_actual = 0
                        # 14.1 .- Acumulado_anterior_amortizacion_numero
                        @acumulado_anterior_amortizacion_numero = 0
                        # 17.1.- Acumulado_anterior_total
                        @acumulado_anterior_total = 0
                        # 21.1 .- Acumulado_anterior_igv_numero
                        @acumulado_anterior_igv_numero = 0
                        # 24.1 .- Acumulado_anterior_total_incluido_igv
                        @acumulado_anterior_total_incluido_igv = 0
                        # 27.1 .- Acumulado_anterior_rentenciones
                        @acumulado_anterior_retenciones = 0
                        # 31.1 .- Acumulado_anterior_detraccion_del_total_numero
                        @acumulado_anterior_detraccion_del_total_numero = 0
                        # 35.1 .- Acumulado_anterior_fondo_garantia_uno_numero
                        @acumulado_anterior_fondo_garantia_uno_numero = 0
                        # 38.1.- Acumulado_anterior_fondo_garantia_dos
                        @acumulado_anterior_fondo_garantia_dos = 0
                        # 41.1.- Acumulado_anterior_descuento_de_equipos
                        @acumulado_anterior_descuento_de_equipos = 0
                        # 47.1 .- Acumulado_anterior_neto_pagar
                        @acumulado_anterior_neto_pagar = 0
                        # 50.2.- valorizacione_contador                        
                        @valorizacione_contador = 1
                        # 53.2.- Acumulado_anterior_descuento_otros
                        @acumulado_anterior_descuento_otros = 0
                        # =======================================================================================                        

                      end


                      # 9.- Actual_valorizacion_actual
                      # ===============================================================================
                      @actual_valorizacion_actual = 0
                      @partidas.each{|partida| @actual_valorizacion_actual += partida[5] }
                      @actual_valorizacion_actual = @actual_valorizacion_actual.round(2)

                      # 11. Acumulado_actual_valorizacion_actual
                      # ===============================================================================
                      @acumulado_actual_valorizacion_actual = @actual_valorizacion_actual - @acumulado_anterior_valorizacion_actual   
                      @acumulado_actual_valorizacion_actual = @acumulado_actual_valorizacion_actual.round(2)


                      # 12 y 13. Actual_amortizacion_porcentaje
                      # ===============================================================================          
                      if !params[:actual_amortizacion_porcentaje].nil? && !params[:actual_amortizacion_numero].nil?
                        @actual_amortizacion_porcentaje = params[:actual_amortizacion_porcentaje].to_f
                        @actual_amortizacion_numero = params[:actual_amortizacion_numero].to_f
                        if @actual_amortizacion_porcentaje.blank? && @actual_amortizacion_numero.blank?
                          @actual_amortizacion_porcentaje = 0.00
                          @actual_amortizacion_numero = 0.00                          
                        end                            
                      else 
                        if @subcontrato['amortizacion_porcentaje'].blank? && @subcontrato['amortizacion_numero'].blank?
                          @actual_amortizacion_porcentaje = 0
                          @actual_amortizacion_numero = 0.00
                        else
                          #entonces ha escrito uno de los dos, preguntamos cual
                          if @subcontrato['amortizacion_porcentaje'].present?
                            @actual_amortizacion_porcentaje = @subcontrato['amortizacion_porcentaje'].to_f
                            @actual_amortizacion_numero = (@actual_amortizacion_porcentaje/100) * @actual_valorizacion_actual
                            @actual_amortizacion_numero = @actual_amortizacion_numero.round(2)
                          else
                            @actual_amortizacion_numero = @subcontrato['amortizacion_numero'].to_f.round(2)
                            @actual_amortizacion_porcentaje = (@actual_amortizacion_numero/@actual_valorizacion_actual) * 100
                            @actual_amortizacion_porcentaje = @actual_amortizacion_porcentaje.round(2)
                          end
                        end
                      end
                          

                      # 15.- Acumulado_anterior_amortizacion_numero
                      # =================================================================================
                      @acumulado_actual_amortizacion_numero = @actual_amortizacion_numero + @acumulado_anterior_amortizacion_numero
                      @acumulado_actual_amortizacion_numero = @acumulado_actual_amortizacion_numero.round(2)


                      # 16.- Actual_total
                      # ================================================================================= 
                      @actual_total = 0
                      @actual_total = @actual_valorizacion_actual - @actual_amortizacion_numero
                      @actual_total = @actual_total.round(2)

                      # 18.- Acumulado_actual_total
                      # =================================================================================
                      @acumulado_actual_total = @actual_total + @acumulado_anterior_total
                      @acumulado_actual_total = @acumulado_actual_total.round(2)


                      # 19.- actual_igv_porcentaje
                      # =================================================================================   
                      @actual_igv_porcentaje = @subcontrato['igv'].to_f          


                      # 20.- Actual_igv_numero
                      # ==================================================================================
                      @actual_igv_numero = (@actual_igv_porcentaje/100)*@actual_total
                      @actual_igv_numero = @actual_igv_numero.round(2)


                      # 22.- Acumulado_actual_igv_numero
                      # ==================================================================================
                      @acumulado_actual_igv_numero = @actual_igv_numero + @acumulado_anterior_igv_numero
                      @acumulado_actual_igv_numero = @acumulado_actual_igv_numero.round(2)


                      # 23.- Actual_total_incluido_igv
                      # ==================================================================================
                      @actual_total_incluido_igv = @actual_total + @actual_igv_numero
                      @actual_total_incluido_igv = @actual_total_incluido_igv.round(2)


                      # 25.- Acumulado_actual_total_incluido_igv
                      # ==================================================================================
                      @acumulado_actual_total_incluido_igv = @actual_total_incluido_igv + @acumulado_anterior_total_incluido_igv
                      @acumulado_actual_total_incluido_igv = @acumulado_actual_total_incluido_igv.round(2)


                      # 29 y 30 .- Actual_detraccion_del_total_porcentaje
                      # ==================================================================================
                      if params[:cheked_count_detraccion_del_total].nil?
                        @cheked_count_detraccion_del_total = 1
                      else
                        if !params[:checkbox_detraccion_del_total].nil?
                          @cheked_count_detraccion_del_total = 1
                        else
                          @cheked_count_detraccion_del_total = 0
                        end
                      end
                      if @subcontrato['detraccion_total_inicial_porcentaje'].blank? or @cheked_count_detraccion_del_total == 0
                        @actual_detraccion_del_total_numero  = 0
                        @actual_detraccion_del_total_porcentaje = 0
                      else            
                        @actual_detraccion_del_total_porcentaje = @subcontrato['detraccion_total_inicial_porcentaje'].to_f
                        @actual_detraccion_del_total_numero = (@actual_detraccion_del_total_porcentaje/100)*@actual_total_incluido_igv
                        @actual_detraccion_del_total_numero = @actual_detraccion_del_total_numero.round(2)
                      end


                      # 32.- Acumulado_actual_detraccion_del_total_numero
                      # ===================================================================================
                      @acumulado_actual_detraccion_del_total_numero = @actual_detraccion_del_total_numero + @acumulado_anterior_detraccion_del_total_numero
                      @acumulado_actual_detraccion_del_total_numero = @acumulado_actual_detraccion_del_total_numero.round(2)



                      # 33.- y 34.- actual_fondo_garantia_uno_porcentaje actual_fondo_garantia_uno_numero
                      # ====================================================================================
                      if params[:cheked_count_fodo_garantia_uno].nil?
                        @cheked_count_fodo_garantia_uno = 1
                      else                        
                        if !params[:checkbox_fodo_garantia_uno].nil?
                          @cheked_count_fodo_garantia_uno = 1
                        else
                          @cheked_count_fodo_garantia_uno = 0
                        end
                      end
                      if @subcontrato['fondo_garantia_porcentaje'].blank? or @cheked_count_fodo_garantia_uno == 0
                        @actual_fondo_garantia_uno_porcentaje = 0
                        @actual_fondo_garantia_uno_numero = 0.00
                      else
                        #entonces ha escrito uno de los dos, preguntamos cual             
                          @actual_fondo_garantia_uno_porcentaje = @subcontrato['fondo_garantia_porcentaje'].to_f
                          @actual_fondo_garantia_uno_numero = (@actual_fondo_garantia_uno_porcentaje/100) * @actual_total_incluido_igv
                          @actual_fondo_garantia_uno_numero = @actual_fondo_garantia_uno_numero.round(2)
                      end


                      # 36.- Acumulado_actual_fondo_garantia_uno_numero
                      # ======================================================================================
                      @acumulado_actual_fondo_garantia_uno_numero = @actual_fondo_garantia_uno_numero + @acumulado_anterior_fondo_garantia_uno_numero
                      @acumulado_actual_fondo_garantia_uno_numero = @acumulado_actual_fondo_garantia_uno_numero.round(2)              



                      # 39.- Acumulado_actual_fondo_garantia_dos
                      # =======================================================================================
                      if params[:cheked_count_fondo_garantia_dos].nil?
                        @cheked_count_fondo_garantia_dos = 1
                      else                        
                        if !params[:checkbox_fondo_garantia_dos].nil?
                          @cheked_count_fondo_garantia_dos = 1
                        else
                          @cheked_count_fondo_garantia_dos = 0
                        end
                      end

                      if @cheked_count_fondo_garantia_dos == 0
                         @acumulado_actual_fondo_garantia_dos = 0.00
                      else
                        @acumulado_actual_fondo_garantia_dos = @actual_fondo_garantia_dos + @acumulado_anterior_fondo_garantia_dos
                        @acumulado_actual_fondo_garantia_dos = @acumulado_actual_fondo_garantia_dos.round(2)                
                      end
                      



                      # 42.- Acumulado_actual_descuento_de_equipos
                      # =======================================================================================
                      @acumulado_actual_descuento_de_equipos = @actual_descuento_de_equipos + @acumulado_anterior_descuento_de_equipos
                      @acumulado_actual_descuento_de_equipos = @acumulado_actual_descuento_de_equipos.round(2)
                      

                      # 43.- Actual_descuento_de_materiales
                      # =======================================================================================
                      @actual_descuento_de_materiales = 0


                      # 44.- Acumulado_anterior_descuento_de_materiales
                      # ========================================================================================
                      @acumulado_anterior_descuento_de_materiales = 0


                      # 45.- Acumulado_actual_descuento_de_materiales
                      # ========================================================================================
                      if params[:cheked_count_descuento_de_materiales].nil?
                        @cheked_count_descuento_de_materiales = 1
                      else                        
                        if !params[:checkbox_descuento_de_materiales].nil?
                          @cheked_count_descuento_de_materiales = 1
                        else                                                                   
                          @cheked_count_descuento_de_materiales = 0
                        end
                      end

                      if @cheked_count_descuento_de_materiales == 0
                        @acumulado_actual_descuento_de_materiales = 0          
                      else
                        @acumulado_actual_descuento_de_materiales = 0          
                      end                     



                      # 52.- actual_descuento_otros
                      # =======================================================================================
                      if params[:cheked_count_descuento_otros].nil?
                        @cheked_count_descuento_otros = 1  
                        @actual_descuento_otros = 0.00                       
                      else                        
                        if !params[:checkbox_descuento_otros].nil?
                          @cheked_count_descuento_otros = 1
                        else                         
                            @cheked_count_descuento_otros = 0                          
                        end
                      end

                      if params[:actual_descuento_otros].nil?
                        @actual_descuento_otros = 0
                      else
                        if @cheked_count_descuento_otros == 0
                          @actual_descuento_otros = 0.00
                        else
                          @actual_descuento_otros = params[:actual_descuento_otros].to_f  
                        end                        
                      end                      

                      # 53.- Acumulado_actual_descuentos_otros
                      # ========================================================================================
                      @acumulado_actual_descuento_otros = @actual_descuento_otros + @acumulado_anterior_descuento_otros


                      # 26.- Actual_retenciones
                      # ==================================================================================
                      @actual_retenciones = (@actual_detraccion_del_total_numero + @actual_fondo_garantia_dos + @actual_descuento_de_equipos + @actual_fondo_garantia_uno_numero + @actual_descuento_otros)
                      @actual_retenciones = @actual_retenciones.round(2)


                      # 28.- Acumulado_actual_retenciones
                      # ==================================================================================
                      @acumulado_actual_retenciones = @actual_retenciones + @acumulado_anterior_retenciones
                      @acumulado_actual_retenciones = @acumulado_actual_retenciones.round(2)

                      
                      # 46.- Actual_neto_pagar
                      # ========================================================================================
                      @actual_neto_pagar = 0
                      @actual_neto_pagar = @actual_total_incluido_igv - @actual_retenciones
                      @actual_neto_pagar = @actual_neto_pagar.round(2)


                      # 48.- Acumulado_actual_neto_pagar
                      # =====================================================================================
                      @acumulado_actual_neto_pagar = @actual_neto_pagar + @acumulado_anterior_neto_pagar
                      @acumulado_actual_neto_pagar = @acumulado_actual_neto_pagar.round(2)

                      # 49.- valorizacione_subcontrato_id
                      # =======================================================================================
                      @valorizacione_subcontrato_id = @subcontrato['id']


                      # *******************************     -_-      *************************************************
                      # *******************************              *************************************************


                      # 3.- subcontratista_nombre
                      # ===============================================================================
                      @subcontratista_nombre = "#{@subcontrato.supplier.entity['nombre']} #{@subcontrato.supplier.entity['apellido']} #{@subcontrato.supplier.entity['razon_social']}"
                      

                      # 4.- monto_contratado
                      # ===============================================================================
                      @monto_contratado = @subcontrato['monto_contratado']


                      # 5.- Adelantos
                      # ===============================================================================
                      @adelantos = 0
                      @subcontrato['adelanto1'].present? ? @adelanto1 = @subcontrato['adelanto1'].to_f : @adelanto1 = 0
                      @subcontrato['adelanto2'].present? ? @adelanto2 = @subcontrato['adelanto2'].to_f : @adelanto2 = 0
                      @subcontrato['adelanto3'].present? ? @adelanto3 = @subcontrato['adelanto3'].to_f : @adelanto3 = 0
                      @subcontrato['adelanto4'].present? ? @adelanto4 = @subcontrato['adelanto4'].to_f : @adelanto4 = 0
                      @adelantos = (@adelanto1 + @adelanto2 + @adelanto3 + @adelanto4)
                      @adelantos = @adelantos.round(2)

                      # 6.- amortizacion_acumulada
                      # ================================================================================
                      @amortizacion_acumulada = @acumulado_actual_amortizacion_numero


                      # 7.- saldo por amortizar
                      @saldo_por_amortizar = @adelantos - @acumulado_actual_amortizacion_numero

                      # 8.-fondo_de_garantia_acumulada
                      # =================================================================================
                      @fondo_de_garantia_acumulada = @acumulado_actual_fondo_garantia_uno_numero
                    else 
                      @pase = 2
                    end
                  else
                      @pase = 2
                  end 

                end
          end 


      end 
    end
    
  end

  def valorizacion_guardar
    @valorizacione = Valuation.new(params[:valorizacione])
    inicio = params[:valorizacione][:fecha_inicial].to_date
    fin    = params[:valorizacione][:fecha_fin].to_date

    dias_habiles = rango_de_dias_habiles(inicio,fin)
    dias_habiles.each do |dia|
      @parteobras = Partwork.where('fecha = ?',dia)
      @parteobras.each do |parteobra|
        parteobra.update_attributes(:aprobado => 1)
      end
    end

    @valorizacione.save
    redirect_to valorizaciones_path    
  end 

  def valorizacion_partidas
    # subcontrato
    @subcontrato_id = params[:subcontrato_id]
    @inicio = params[:inicio]
    @fin = params[:fin]
    @gruposdetrabajos = Groupsofwork.where("subcontract_id = ? and activo = ?", @subcontrato_id, 'Si')
    @parteobras = []
    @partidas = []
    partidas = []
    @gruposdetrabajos.each do |gdt|
      @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'],@inicio,@fin)
    end
    @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}    
    @partidas = funcion_partidas(partidas)

    # titulo del sistema
    subcontrato = Subcontract.find_by_id(@subcontrato_id)
    @subcontrato_nombre = "#{subcontrato.supplier.entity.razon_social} #{subcontrato.supplier.entity.nombre} #{subcontrato.supplier.entity.apellido}"

  end

  
  def valorizacion_equipos
    @subcontrato_id = params[:subcontrato_id]
    @inicio = params[:inicio]
    @fin = params[:fin]   

    @gruposdetrabajos = Groupsofwork.where("subcontract_id = ? and activo = ?", @subcontrato_id, 'Si')    
    @equipos = funcion_equipos(@inicio,@fin,@gruposdetrabajos)
    subcontrato = Subcontract.find_by_id(@subcontrato_id)
    @subcontrato_nombre = "#{subcontrato.supplier.entity.razon_social} #{subcontrato.supplier.entity.nombre} #{subcontrato.supplier.entity.apellido}"
  end

  def valorizacion_manodeobras
    @subcontrato_id = params[:subcontrato_id]
    @inicio = params[:inicio]
    @fin = params[:fin]

    @parteobras = []
    @partidas = []
    @partediariodepersonals = []
    partidas = []
    trabajadores = []

    @gruposdetrabajos = Groupsofwork.where("subcontract_id = ? and activo = ?", @subcontrato_id, 'Si')
    @gruposdetrabajos.each do |gdt|
      @parteobras += Partwork.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'],@inicio,@fin)      
      @partediariodepersonals += Partdayliofperson.where('groupsofwork_id = ? and date(fecha) BETWEEN ? AND ?', gdt['id'], @inicio, @fin)
    end
    @parteobras.each {|parteobra| partidas += Item.where('partwork_id = ?', parteobra['id']).select('id,list_id, metrado')}    
    @partediariodepersonals.each{|partediariodepersonal| trabajadores += Worker.where('partdayliofperson_id = ?',partediariodepersonal['id'])}

    @partidas = funcion_partidas(partidas)
    @manodeobras = funcion_manodeobras(trabajadores)
    @equipos = funcion_equipos(@inicio,@fin,@gruposdetrabajos)

    subcontrato = Subcontract.find_by_id(@subcontrato_id)
    @subcontrato_nombre = "#{subcontrato.supplier.entity.razon_social} #{subcontrato.supplier.entity.nombre} #{subcontrato.supplier.entity.apellido}"

  end

  def ver_valorizacion_partidas
    @valorizacione_id = params[:valorizacione_id]
    @subcontrato_id = params[:subcontrato_id]
    @vpartidas = Vitem.where('valorizacione_id = ?', @valorizacione_id)

    subcontrato = Subcontrato.find_by_id(@subcontrato_id)
    @subcontrato_nombre = "#{subcontrato.proveedore.ente.razon_social} #{subcontrato.proveedore.ente.nombre} #{subcontrato.proveedore.ente.apellido}"
  end 

  def ver_valorizacion_manodeobra
    @valorizacione_id = params[:valorizacione_id]
    @subcontrato_id = params[:subcontrato_id]
    @vmanodeobras = Vmanodeobra.where('valorizacione_id = ?', @valorizacione_id)

    subcontrato = Subcontrato.find_by_id(@subcontrato_id)
    @subcontrato_nombre = "#{subcontrato.proveedore.ente.razon_social} #{subcontrato.proveedore.ente.nombre} #{subcontrato.proveedore.ente.apellido}"
  end

  def ver_valorizacion_equipos
    @valorizacione_id = params[:valorizacione_id]
    @subcontrato_id = params[:subcontrato_id]
    @vequipos = Vequipo.where('valorizacione_id = ?', @valorizacione_id)

    subcontrato = Subcontrato.find_by_id(@subcontrato_id)
    @subcontrato_nombre = "#{subcontrato.proveedore.ente.razon_social} #{subcontrato.proveedore.ente.nombre} #{subcontrato.proveedore.ente.apellido}"
  end


  def equipo_days
    equiposdesubcontrato = Equiposdesubcontrato.find_by_id(params[:equiposdesubcontrato_id])
    subcontratodeequipo = equiposdesubcontrato.subcontratodeequipo
    @subcontratodeequipo_nombre = "#{equiposdesubcontrato.subcontratodeequipo.proveedore.ente.nombre} #{equiposdesubcontrato.subcontratodeequipo.proveedore.ente.apellido} #{equiposdesubcontrato.subcontratodeequipo.proveedore.ente.razon_social}"
    @insumodeequipo = equiposdesubcontrato.insumodeequipo.nombre
    @equipodesubcontrato_partes = matriz_maquinaria(params[:inicio],params[:fin],params[:equiposdesubcontrato_id])
  end


  def matriz_maquinaria(inicio, fin, equiposdesubcontrato)
    @dias_habiles = rango_de_dias_habiles(inicio.to_date, fin.to_date)
    temp_matriz_reportemaquinarias = []
    suma_matriz_total_efectivas = 0
    suma_matriz_combustible = 0
    suma_combustible_precio_x_cantidad = 0
    suma_matriz_horas = 0
    recupera_equipodesubcontrato = Equiposdesubcontrato.find_by_id(equiposdesubcontrato)
    nombre_equipodesubcontrato = "#{recupera_equipodesubcontrato.codigo} #{recupera_equipodesubcontrato.descripcion}"
    unidade_equipodesubcontrato = recupera_equipodesubcontrato.unidade.nombre
    precio_equipodesubcontrato = recupera_equipodesubcontrato.precion_sin_igv.to_f
    @dias_habiles.each do |dias_habile|
      fecha  =  dias_habile
      partedeequipo =  Partedeequipo.where("equiposdesubcontrato_id = ? and fecha = ?", equiposdesubcontrato, fecha)
      if partedeequipo.length != 0
        
        horometro_inicio = partedeequipo[0].inicio.to_f
        horometro_fin = partedeequipo[0].fin.to_f
        horometro_horas = horometro_fin - horometro_inicio
        partedeequipos_numero = partedeequipo[0].numero
        combustibletipo = "#{partedeequipo[0].combustibletipo.tipo} #{partedeequipo[0].combustibletipo.combustible}"
        # sacando Horas Efectivas
        suma_total_horas_efectivas = 0
        suma_efectivas = 0
        combustible_cantidad = partedeequipo[0].combustible_cantidad.to_f
        precio_combustible = partedeequipo[0].combustibletipo.precio.to_f
        combustible_precio_x_cantidad = combustible_cantidad*precio_combustible
        suma_combustible_precio_x_cantidad += combustible_precio_x_cantidad
        partedeequipo[0].equiposregistrados.each{|equiposregistrado| suma_total_horas_efectivas +=  equiposregistrado.cantidad.to_f}

        partedeequipo[0].equiposregistrados.each do |equiposregistrado|
          #suma_efectivas += ((equiposregistrado.cantidad.to_f*combustible_cantidad)/suma_total_horas_efectivas)
          suma_efectivas += equiposregistrado.cantidad.to_f
        end
        suma_matriz_total_efectivas += suma_efectivas
        suma_matriz_combustible += combustible_cantidad
        suma_matriz_horas += horometro_horas
      else
        
        horometro_inicio = ''
        horometro_fin = ''
        horometro_horas = ''
        partedeequipos_numero = ''
        horas_efectivas = ''
        suma_efectivas = ''
        combustibletipo = ''
        combustible_cantidad = ''
        combustible_precio_x_cantidad = 0
      end

      # matriz de detalle de equipos
      #     [0]                             Fecha
      #     [1]                             horometro_inicio
      #     [2]                             horometro_fin
      #     [3]                             partedeequipos_numero
      #     [4]                             horometro_horas
      #     [5]                             suma_Efectivas
      #     [6]                             combustible_tipo
      #     [7]                             combustible_cantidad  
      #     [8]                             combustible_precio_x_cantidad
      if partedeequipos_numero.present?
      temp_matriz_reportemaquinarias << [l(fecha.to_date, format: :fecha), horometro_inicio, horometro_fin, partedeequipos_numero, horometro_horas, suma_efectivas, combustibletipo,combustible_cantidad,combustible_precio_x_cantidad]
      end
    end
      

    # matriz que se agrega por equipo matriz_reportemaquinarias[0,1,2,3,4,5,6,7]   

    # 
    # [7]             :                     monto                   :             00.00  
    if suma_matriz_total_efectivas == 0
      monto = 0
    else
      monto = (suma_matriz_total_efectivas * precio_equipodesubcontrato)
    end
    matriz_reportemaquinarias = []

    # matriz_reportemaquinarias [ 0, 1, 2, 3, 4, 5, 6, 7 ]
    # [0]             :               Nombre_Equiposubcontrato
    # [1]             :               suma_matriz_horas
    # [2]             :               suma_matriz_total_efectivas
    # [3]             :               suma_matriz_combustible
    # [4]             :               temp_matriz_reportemaquinarias
    # [5]             :               unidade_equipodesubcontrato
    # [6]             :               precio_equipodesubcontrato
    # [7]             :               monto
    # [8]             :               suma_combustible_precio_x_cantidad
    matriz_reportemaquinarias << [nombre_equipodesubcontrato,suma_matriz_horas,suma_matriz_total_efectivas,suma_matriz_combustible, temp_matriz_reportemaquinarias, unidade_equipodesubcontrato,precio_equipodesubcontrato, monto,suma_combustible_precio_x_cantidad,equiposdesubcontrato]
    return matriz_reportemaquinarias
  end



  def rango_de_dias_habiles(inicio, fin)
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

  def ver_equipodays
    @vequipodays = Vequipoday.where('vequipo_id = ?', params[:vequipo_id])
    @equipodesubcontrato_nombre = "#{@vequipodays[0].vequipo.equiposdesubcontrato.subcontratodeequipo.proveedore.ente.nombre} #{@vequipodays[0].vequipo.equiposdesubcontrato.subcontratodeequipo.proveedore.ente.apellido} #{@vequipodays[0].vequipo.equiposdesubcontrato.subcontratodeequipo.proveedore.ente.razon_social}"
    @insumodeequipo_nombre = "#{@vequipodays[0].vequipo.equiposdesubcontrato.insumodeequipo.nombre}"
  end

  private
  def valuation
    params.require(:valuation).permit(:fecha_inicial, :fecha_fin, :subcontratista_nombre, :monto_contratado, :adelantos, :amortizacion_acumulada, :saldo_por_amortizar, :fondo_de_garantia_acumulada, :actual_valorizacion_actual, :acumulado_anterior_valorizacion_actual, :acumulado_actual_valorizacion_actual, :actual_amortizacion_porcentaje, :actual_amortizacion_numero, :acumulado_anterior_amortizacion_numero, :acumulado_actual_amortizacion_numero, :actual_total, :acumulado_anterior_total, :acumulado_actual_total, :actual_igv_porcentaje, :actual_igv_numero, :acumulado_anterior_igv_numero, :acumulado_actual_igv_numero, :actual_total_incluido_igv, :acumulado_anterior_total_incluido_igv, :acumulado_actual_total_incluido_igv, :actual_retenciones, :acumulado_anterior_retenciones, :acumulado_actual_retenciones, :actual_detraccion_del_total_porcentaje, :actual_detraccion_del_total_numero, :acumulado_anterior_detraccion_del_total_numero, :acumulado_actual_detraccion_del_total_numero, :actual_fondo_garantia_uno_porcentaje, :actual_fondo_garantia_uno_numero, :acumulado_anterior_fondo_garantia_uno_numero, :acumulado_actual_fondo_garantia_uno_numero, :actual_fondo_garantia_dos, :acumulado_anterior_fondo_garantia_dos, :acumulado_actual_fondo_garantia_dos, :actual_descuento_de_equipos, :acumulado_anterior_descuento_de_equipos, :acumulado_actual_descuento_de_equipos, :actual_descuento_de_materiales, :acumulado_anterior_descuento_de_materiales, :acumulado_actual_descuento_de_materiales, :actual_neto_pagar, :acumulado_anterior_neto_pagar, :acumulado_actual_neto_pagar, :valorizacione_subcontrato_id, :valorizacione_contador, :valorizacione_aprobado, :vmanodeobras_attributes, :vequipos_attributes, :actual_descuento_otros, :acumulado_anterior_descuento_otros, :acumulado_actual_descuento_otros, :subcontract_id, :vitems_attributes)
  end


end
