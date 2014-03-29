class Production::PartdayliofpeopleController < ApplicationController
  def index
    @combo_opcions = []
    if !params[:partediariodepersonal_campo].nil? and !params[:partediariodepersonal_opcion].nil?
      partediariodepersonal_campo =  params[:partediariodepersonal_campo].to_i
      partediariodepersonal_opcion = params[:partediariodepersonal_opcion]
      @array_partediariodepersonals = Partdayliofperson.all
      if partediariodepersonal_campo == 1
        @partdayliofpeople = Partdayliofperson.where('id = ?',partediariodepersonal_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_partediariodepersonals.each do |opcion|
          @combo_opcions << [opcion.numero,opcion.id]
        end
      elsif partediariodepersonal_campo == 2
        @partdayliofpeople = Partdayliofperson.where('groupsofwork_id = ?',partediariodepersonal_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_partediariodepersonals.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social} - 
              #{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.supplier.entity.razon_social} - 
              #{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}",opcion.groupsofwork_id]
        end
      elsif partediariodepersonal_campo == 3
        @partdayliofpeople = Partdayliofperson.joins(:groupsofwork).where('groupsofworks.subcontract_id = ?',partediariodepersonal_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_partediariodepersonals.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.supplier.entity.razon_social}",opcion.groupsofwork.subcontract.id]
        end
      elsif partediariodepersonal_campo == 4
        @partdayliofpeople = Partdayliofperson.joins(:groupsofwork).where('groupsofworks.chiefoffront_id = ?',partediariodepersonal_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')                
        @array_partediariodepersonals.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social}",opcion.groupsofwork.chiefoffront.id]
        end
      elsif partediariodepersonal_campo == 5
        @partdayliofpeople = Partdayliofperson.joins(:groupsofwork).where('groupsofworks.teacherofwork_id = ?',partediariodepersonal_opcion.to_i).paginate(:page => params[:page], :per_page => 20).order('id Desc')
        @array_partediariodepersonals.each do |opcion|
          @combo_opcions << ["#{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}",opcion.groupsofwork.teacherofwork.id]
        end
      elsif partediariodepersonal_campo == 6
        @partdayliofpeople = Partdayliofperson.where('fecha = ?',partediariodepersonal_opcion).paginate(:page => params[:page], :per_page => 20).order('id Desc')      
        @array_partediariodepersonals.each do |opcion|
          @combo_opcions << ["#{opcion.fecha}",opcion.fecha]
        end
      end      
    else
      @partdayliofpeople = Partdayliofperson.paginate(:page => params[:page], :per_page => 20).order('id Desc')
    end

    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @partdayliofpeople }
    end
  end

  def show
    @partdayliofperson = Partdayliofperson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @partdayliofperson }
    end
  end

  def new
    @partdayliofperson = Partdayliofperson.new      
    @partediariodepersonal_last = Partdayliofperson.last

    if @partediariodepersonal_last.nil?
      @partediariodepersonal_numero = 0 + 1
    else
      @partediariodepersonal_numero = @partediariodepersonal_last.numero.to_i + 1
    end 
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @partdayliofperson }
    end
  end

  def edit
    @partdayliofperson = Partdayliofperson.find(params[:id])    
  end

  def create
    @partdayliofperson = Partdayliofperson.new(partdayliofperson_parameters)

    respond_to do |format|
      if @partdayliofperson.save
        format.html { redirect_to production_partdayliofperson_path(@partdayliofperson), notice: 'partdayliofperson was successfully created.' }
        format.json { render json: @partdayliofperson, status: :created, location: @partdayliofperson }
      else
        format.html { render action: "new" }
        format.json { render json: @partdayliofperson.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @partdayliofperson = Partdayliofperson.find(params[:id])

    respond_to do |format|
      if @partdayliofperson.update_attributes(partdayliofperson_parameters)
        format.html { redirect_to production_partdayliofperson_path(@partdayliofperson), notice: 'partdayliofperson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @partdayliofperson.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @partdayliofperson = Partdayliofperson.find(params[:id])
    @partdayliofperson.destroy

    respond_to do |format|
      format.html { redirect_to production_partdayliofpeople_url }
      format.json { head :no_content }
    end
  end

  def values_partidasdecontrol
    id = params[:id]
    @grupo = Groupsofwork.find(id)
    @subsectore_id = @grupo[:subsector_id]
    @partidasdecontrols= Itemsofcontrol.where(subsector_id: @subsectore_id).all

    respond_to do |format|
      format.html {render :layout => 'select'}
    end
  end


  def values_opcion
    id = params[:id].to_i
    @combo_opcions = []
    if id == 1
      @parteobras = Partdayliofperson.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.id,opcion.numero]
      end
    elsif id == 2
      @parteobras = Partdayliofperson.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork_id,"#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social} - 
              #{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.supplier.entity.razon_social} - 
              #{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}"]
      end
    elsif id == 3
      @parteobras = Partdayliofperson.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork.subcontract.id,"#{opcion.groupsofwork.subcontract.supplier.entity.nombre} #{opcion.groupsofwork.subcontract.supplier.entity.apellido} #{opcion.groupsofwork.subcontract.proveedore.entity.razon_social}"]
      end
    elsif id == 4
      @parteobras = Partdayliofperson.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork.chiefoffront.id,"#{opcion.groupsofwork.chiefoffront.entity.nombre} #{opcion.groupsofwork.chiefoffront.entity.apellido} #{opcion.groupsofwork.chiefoffront.entity.razon_social}"]
      end
    elsif id == 5
      @parteobras = Partdayliofperson.all
      @parteobras.each do |opcion|
        @combo_opcions << [opcion.groupsofwork.teacherofwork.id,"#{opcion.groupsofwork.teacherofwork.entity.nombre} #{opcion.groupsofwork.teacherofwork.entity.apellido} #{opcion.groupsofwork.teacherofwork.entity.razon_social}"]
      end
    elsif id == 6
      @parteobras = Partdayliofperson.all
      @parteobras.each do |opcion|
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
  def partdayliofperson_parameters
    params.require(:partdayliofperson).permit!
    #params.require(:partdayliofperson).permit(:numero, :groupsofwork_id, :fecha, :aprobado, :workers_attributes)
  end

end
