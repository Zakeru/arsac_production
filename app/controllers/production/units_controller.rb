class Production::UnitsController < ApplicationController
  # GET /unidades
  # GET /unidades.json
  def index
    @units = Unit.all

    respond_to do |format|
      format.html
      format.json { render json: @units }
    end
  end

  def show
    @unit = Unit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit }
    end
  end

  def new
    @unit = Unit.new

    respond_to do |format|
      format.html
      format.json { render json: @unit }
    end
  end


  def edit
    @unit = Unit.find(params[:id])
  end

  def create
    @unit = Unit.new(unit_parameters)

    respond_to do |format|
      if @unit.save
        format.html { redirect_to production_unit_path(@unit), notice: 'Unidade was successfully created.' }
        format.json { render json: @unit, status: :created, location: @unit }
      else
        format.html { render action: "new" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unidades/1
  # PUT /unidades/1.json
  def update
    @unit = Unit.find(params[:id])

    respond_to do |format|
      if @unit.update_attributes(unit_parameters)
        format.html { redirect_to production_unit_path(@unit), notice: 'Unidade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unidades/1
  # DELETE /unidades/1.json
  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    respond_to do |format|
      format.html { redirect_to production_units_url }
      format.json { head :no_content }
    end
  end

  private
  def unit_parameters
    params.require(:unit).permit(:descripcion, :nombre)
  end  


end
