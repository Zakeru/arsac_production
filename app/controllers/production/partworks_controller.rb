class Production::PartworksController < ApplicationController

  def index
    @combo_opcions = []
    if !params[:parteobra_campo].nil? and !params[:parteobra_opcion].nil?
      parteobra_campo =  params[:parteobra_campo].to_i
      parteobra_opcion = params[:parteobra_opcion]
      @array_parteobras = Partwork.all

      if parteobra_campo == 1
        @partworks =  Partwork.where('id = ?',parteobra_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_parteobras.each do |opcion|
          @combo_opcions << [opcion.numero,opcion.id]
        end
      elsif parteobra_campo == 2
        @partworks =  Partwork.where('front_id = ?',parteobra_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_parteobras.each do |opcion|
          @combo_opcions << [opcion.front.nombre,opcion.front_id]
        end
      elsif parteobra_campo == 3
        @partworks =  Partwork.joins(:groupsofwork => :chiefoffront).where('chiefoffronts.id = ?',parteobra_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_parteobras.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social}",opcion.groupsofwork.chiefoffront.id]
        end
      elsif parteobra_campo == 4
        @partworks =  Partwork.joins(:groupsofwork).where('groupsofworks.subcontract_id = ?',parteobra_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')                
        @array_parteobras.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.supplier.entity.razon_social}",opcion.groupsofwork.subcontract.id]
        end
      elsif parteobra_campo == 5
        @partworks =  Partwork.joins(:groupsofwork).where('groupsofworks.teacherofwork_id = ?',parteobra_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_parteobras.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}",opcion.groupsofwork.teacherofwork.id]
        end
      elsif parteobra_campo == 6
        @partworks =  Partwork.where('fecha = ?',parteobra_opcion).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_parteobras.each do |opcion|
          @combo_opcions << ["#{opcion.fecha}",opcion.fecha]
        end
      elsif parteobra_campo == 7
        @partworks =  Partwork.where('groupsofwork_id = ?',parteobra_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')        
        @array_parteobras.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social} - #{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.supplier.entity.razon_social} - #{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}",opcion.groupsofwork_id]
        end
      end  
      @combo_opcions = elimina_repetidos(@combo_opcions)    
    else
      @partworks =  Partwork.paginate(:page => params[:page], :per_page => 20).order('id Desc')
    end
    

    respond_to do |format|
      format.html 
      format.json { render json: @parteobras }
    end
  end

  def show
    @partwork = Partwork.find(params[:id])
    respond_to do |format|
      format.html
      #format.pdf do
      #  pdf = Prawn::Document.new
      #  pdf.text "Hola mundo"
      #  send_data pdf.render, type: "application/pdf", disposition: "inline"
      #end
    end
  end

  def new
    @partwork = Partwork.new
    @listcategories = Listcategory.all
    @itemsofcontrols = Itemsofcontrol.all
    @sectors = Sector.all

    @parteobra_last = Partwork.last
    if @parteobra_last.nil?
      @parteobra_numero = 0 + 1
    else
      @parteobra_numero = @parteobra_last.numero.to_i + 1
    end    

    respond_to do |format|
      format.html 
      format.json { render json: @partwork }
    end
  end

  def edit
    @partwork = Partwork.find(params[:id])    
    @sectors = Sector.all
  end


  def create

    @partwork = Partwork.new(partwork_parameters) 
	  @listcategories = Listcategory.all
    @itemsofcontrols = Itemsofcontrol.all 
    @sectors = Sector.all  

	  respond_to do |format|
      if @partwork.save
        format.html { redirect_to production_partwork_path(@partwork), notice: 'Partida was successfully created.' }
        format.json { render json: @partwork, status: :created, location: @partwork }
      else
        format.html { render :action => "new" }
        #format.html { render action: "new", :controller=>"partwork" }
        format.json { render json: @partwork.errors, status: :unprocessable_entity }
      end
    end    

  end


  def update
    @partwork = Partwork.find(params[:id])

    respond_to do |format|
      if @partwork.update_attributes(partwork_parameters)
        format.html { redirect_to production_partwork_path(@partwork), notice: 'Parteobra was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @partwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partwork = Partwork.find(params[:id])
    @partwork.destroy

    respond_to do |format|
      format.html { redirect_to partworks_url }
      format.json { head :no_content }
    end
  end

  def values_partidaunidad
    @listas = List.where(:id => params[:id])
    respond_to do |format|
      format.html {render :layout => 'select'}
    end
  end

  def values_partidasdecontrol
    id = params[:id]
    @grupo = Gruposdetrabajo.find_by_id(id)
    subsectore_id = @grupo[:subsectore_id]    
    @partidasdecontrols = Partidasdecontrol.where(subsectore_id: subsectore_id).all
    respond_to do |format|
      format.html {render :layout => 'select'}
    end
  end

  def values_tipodevale
    if !params[:id].nil?
      id = params[:id]
    else
      id = 'nulo'  
    end    

    if id == 'agregado'
      @values = '
      <option value="arena_para_cama">Arena Para Cama</option>
      <option value="material_de_relleno">Material De Relleno</option>
      <option value="piedra_chancada">Piedra Chancada</option>
      <option value="arena_gruesa">Arena Gruesa</option>
      <option value="arena_fina">Arena Fina</option>'      
    elsif id == 'eliminacion'
      @values = '<option value="eliminacion">Eliminacion</option>' 
    elsif id == 'agua'
      @values = '<option value="agua">Agua</option>'
    elsif id == 'nulo'
      @values = '
      <option value="arena_para_cama">Arena Para Cama</option>
      <option value="material_de_relleno">Material De Relleno</option>
      <option value="piedra_chancada">Piedra Chancada</option>
      <option value="arena_gruesa">Arena Gruesa</option>
      <option value="arena_fina">Arena Fina</option>
      <option value="eliminacion">Eliminacion</option>
      <option value="agua">Agua</option>'
    end                                            

    respond_to do  |format|
      format.html {render :layout => 'select'}
    end    
  end  

  def values_opcion
    id = params[:id].to_i
    @combo_opcions = []
    if id == 1
      @parteobras = Partwork.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.id,opcion.numero]
      end
    elsif id == 2
      @parteobras = Partwork.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.front_id,opcion.front.nombre]
      end
    elsif id == 3
      @parteobras = Partwork.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork.chiefoffront.id,"#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social}"]
      end
    elsif id == 4
      @parteobras = Partwork.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork.subcontract.id,"#{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.supplier.entity.razon_social}"]
      end
    elsif id == 5
      @parteobras = Partwork.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork.teacherofwork.id,"#{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}"]
      end
    elsif id == 6
      @parteobras = Partwork.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.fecha,"#{opcion.fecha}"]
      end
    elsif id == 7
      @parteobras = Partwork.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork_id,"#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social} - #{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.supplier.entity.razon_social} - #{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}"]
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
  def partwork_parameters
    params.require(:partwork).permit!
    #params.require(:partwork).permit(:numero, :groupsofwork_id, :aprobado, :fecha, :front_id, :items_attributes)
  end

end
