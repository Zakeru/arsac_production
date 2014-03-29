class Production::SubsectorsController < ApplicationController

  def index
    @subsectors = Subsector.all

    respond_to do |format|
      format.html
      format.json { render json: @subsectors }
    end
  end

  def show
    @subsector = Subsector.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subsector }
    end
  end


  def new
    @subsector = Subsector.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subsector }
    end
  end


  def edit
    @subsector = Subsector.find(params[:id])
  end


  def create
    @subsector = Subsector.new(subsector_parameters)

    respond_to do |format|
      if @subsector.save
        format.html { redirect_to production_subsector_path(@subsector), notice: 'Subsectore was successfully created.' }
        format.json { render json: @subsector, status: :created, location: @subsector }
      else
        format.html { render action: "new" }
        format.json { render json: @subsector.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @subsector = Subsector.find(params[:id])

    respond_to do |format|
      if @subsector.update_attributes(subsector_parameters)
        format.html { redirect_to production_subsector_path(@subsector), notice: 'Subsectore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subsector.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @subsector = Subsector.find(params[:id])
    @subsector.destroy

    respond_to do |format|
      format.html { redirect_to production_subsectores_url }
      format.json { head :no_content }
    end
  end

  private
  def subsector_parameters
    params.require(:subsector).permit(:codigo, :descripcion, :sector_id)
  end

end
