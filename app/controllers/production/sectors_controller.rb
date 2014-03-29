class Production::SectorsController < ApplicationController
  # GET /sectores
  # GET /sectores.json
  def index
    @sectors = Sector.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sectors }
    end
  end

  # GET /Sectors/1
  # GET /Sectors/1.json
  def show
    @sector = Sector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sector }
    end
  end

  # GET /Sectors/new
  # GET /Sectors/new.json
  def new
    @sector = Sector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sector }
    end
  end

  # GET /Sectors/1/edit
  def edit
    @sector = Sector.find(params[:id])
  end

  # POST /Sectors
  # POST /Sectors.json
  def create
    @sector = Sector.new(sector_parameters)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to production_sector_path(@sector), notice: 'Sector was successfully created.' }
        format.json { render json: @sector, status: :created, location: @sector }
      else
        format.html { render action: "new" }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /Sectors/1
  # PUT /Sectors/1.json
  def update
    @sector = Sector.find(params[:id])

    respond_to do |format|
      if @sector.update_attributes(sector_parameters)
        format.html { redirect_to production_sector_path(@sector), notice: 'Sector was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Sectors/1
  # DELETE /Sectors/1.json
  def destroy
    @sector = Sector.find(params[:id])
    @sector.destroy

    respond_to do |format|
      format.html { redirect_to production_sectors_url }
      format.json { head :no_content }
    end
  end

  private
  def sector_parameters
    params.require(:sector).permit(:codigo, :descripcion)
  end

end
