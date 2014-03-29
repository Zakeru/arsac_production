class Production::EntitiesController < ApplicationController
  def index    
    @entities = Entity.paginate(:page => params[:page], :per_page => 20).order('id Desc')

    respond_to do |format|
      format.html
      format.json { render json: @entities }
    end
  end

  def show
    @entity = Entity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @entity }
    end
  end

  def new
    @entity = Entity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @entity }
    end
  end

  # GET /entes/1/edit
  def edit
    @entity = Entity.find(params[:id])
  end

  # POST /entes
  # POST /entes.json
  def create
    @entity = Entity.new(entity_parameters)
    respond_to do |format|
      if @entity.save
        format.html { redirect_to production_entity_path(@entity), notice: 'El ente se ha creado correctamente..!' }
        format.json { render json: @entity, status: :created, location: @entity }
      else
        format.html { render action: "new" }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /entes/1
  # PUT /entes/1.json
  def update
    @entity = Entity.find(params[:id])

    respond_to do |format|
      if @entity.update_attributes(entity_parameters)
        format.html { redirect_to production_entity_path(@entity), notice: 'El ente se ha actualizado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entes/1
  # DELETE /entes/1.json
  def destroy
    @entity = Entity.find(params[:id])

    proveedores            =     Supplier.where('entity_id = ?', params[:id])
    jefesdefrentes         =     Chiefoffront.where('entity_id = ?', params[:id])
    maestrodeobras         =     Teacherofwork.where('entity_id = ?', params[:id])
    catalogodetrabajadores =     Catalogofwork.where('entity_id = ?', params[:id])

    proveedores_count      =     proveedores.count
    jefesdefrentes_count   =     jefesdefrentes.count
    maestrodeobras_count   =     maestrodeobras.count
    catalogodetrabajadores_count = catalogodetrabajadores.count
    errores = ''

    if proveedores_count  != 0
      errores = errores + ' proveedores, '      
    end 

    if jefesdefrentes_count != 0
      errores = errores + 'jefesdefrentes, '
    end

    if maestrodeobras_count != 0
      errores = errores + 'maestrodeobras, '
    end

    if catalogodetrabajadores_count != 0
      errores = errores + 'Catalogodetrabajadores.'
    end

    if proveedores_count == 0 && jefesdefrentes_count == 0 && maestrodeobras_count == 0 && catalogodetrabajadores_count == 0
      @entity.destroy
      redirect_to production_entities_path, notice: "Se han eliminado correctamente el ente."
    else
      redirect_to production_entities_path, notice: "No se puede eliminar por que el ente tiene dependencia con: #{errores} "
    end
    
  end

  private
  def entity_parameters
    params.require(:entity).permit(:nombre, :ruc, :dni, :apellido)
  end
  
end
