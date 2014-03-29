class Production::CatalogcategoryworksController < ApplicationController
  def index
    @catalogcategoryworks = Catalogcategorywork.all

    respond_to do |format|
      format.html
      format.json { render json: @catalogcategoryworks }
    end
  end

  def show
    @catalogcategorywork = Catalogcategorywork.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @catalogcategorywork }
    end
  end

  def new
    @catalogcategorywork = Catalogcategorywork.new

    respond_to do |format|
      format.html 
      format.json { render json: @catalogcategorywork }
    end
  end

  def edit
    @catalogcategorywork = Catalogcategorywork.find(params[:id])
  end

  def create
    @catalogcategorywork = Catalogcategorywork.new(catalogcategorywork_parameters)

    respond_to do |format|
      if @catalogcategorywork.save
        format.html { redirect_to production_catalogcategorywork_path(@catalogcategorywork), notice: 'catalogcategorywork was successfully created.' }
        format.json { render json: @catalogcategorywork, status: :created, location: @catalogcategorywork }
      else
        format.html { render action: "new" }
        format.json { render json: @catalogcategorywork.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @catalogcategorywork = Catalogcategorywork.find(params[:id])

    respond_to do |format|
      if @catalogcategorywork.update_attributes(catalogcategorywork_parameters)
        format.html { redirect_to production_catalogcategorywork_path(@catalogcategorywork), notice: 'catalogcategorywork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @catalogcategorywork.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @catalogcategorywork = Catalogcategorywork.find(params[:id])
    @catalogcategorywork.destroy

    respond_to do |format|
      format.html { redirect_to production_catalogcategoryworks_url }
      format.json { head :no_content }
    end
  end

  private
  def catalogcategorywork_parameters
    params.require(:catalogcategorywork).permit(:nombre, :unit_id, :precio_unitario_normal, :precio_unitario_60, :precio_unitario_100)
  end

end
