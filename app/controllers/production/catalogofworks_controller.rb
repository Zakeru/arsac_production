class Production::CatalogofworksController < ApplicationController

  def index
    @catalogofworks = Catalogofwork.order('id Desc')

    respond_to do |format|
      format.html
      format.json { render json: @catalogofworks }
    end
  end

  def show
    @catalogofwork = Catalogofwork.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @catalogofwork }
    end
  end

  def new
    @catalogofwork = Catalogofwork.new

    respond_to do |format|
      format.html 
      format.json { render json: @catalogofwork }
    end
  end

  def edit
    @catalogofwork = Catalogofwork.find(params[:id])
  end

  def create
    @catalogofwork = Catalogofwork.new(catalogofwork_parameters)

    respond_to do |format|
      if @catalogofwork.save
        format.html { redirect_to production_catalogofwork_path(@catalogofwork), notice: 'catalogofwork was successfully created.' }
        format.json { render json: @catalogofwork, status: :created, location: @catalogofwork }
      else
        format.html { render action: "new" }
        format.json { render json: @catalogofwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @catalogofwork = Catalogofwork.find(params[:id])

    respond_to do |format|
      if @catalogofwork.update_attributes(catalogofwork_parameters)
        format.html { redirect_to production_catalogofwork_path(@catalogofwork), notice: 'catalogofwork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catalogofwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @catalogofwork = Catalogofwork.find(params[:id])
    @catalogofwork.destroy

    respond_to do |format|
      format.html { redirect_to production_catalogofworks_url }
      format.json { head :no_content }
    end
  end

  private
  def catalogofwork_parameters
    params.require(:catalogofwork).permit(:entity_id, :telefono, :movil, :direccion, :mail, :numero_cuenta, :banco, :fecha_nacimiento, :catalogcategorywork_id)
  end

end
