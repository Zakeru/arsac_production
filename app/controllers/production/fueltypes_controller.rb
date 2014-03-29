class Production::FueltypesController < ApplicationController
  def index
    @fueltypes = Fueltype.all

    respond_to do |format|
      format.html
      format.json { render json: @fueltypes }
    end
  end

  def show
    @fueltype = Fueltype.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @fueltype }
    end
  end

  def new
    @fueltype = Fueltype.new

    respond_to do |format|
      format.html 
      format.json { render json: @fueltype }
    end
  end

  def edit
    @fueltype = Fueltype.find(params[:id])
  end

  def create
    @fueltype = Fueltype.new(fueltype_parameters)

    respond_to do |format|
      if @fueltype.save
        format.html { redirect_to production_fueltype_path(@fueltype), notice: 'fueltype was successfully created.' }
        format.json { render json: @fueltype, status: :created, location: @fueltype }
      else
        format.html { render action: "new" }
        format.json { render json: @fueltype.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @fueltype = Fueltype.find(params[:id])

    respond_to do |format|
      if @fueltype.update_attributes(fueltype_parameters)
        format.html { redirect_to production_fueltype_path(@fueltype), notice: 'fueltype was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fueltype.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fueltype = Fueltype.find(params[:id])
    @fueltype.destroy

    respond_to do |format|
      format.html { redirect_to production_fueltypes_url }
      format.json { head :no_content }
    end
  end

  private
  def fueltype_parameters
    params.require(:fueltype).permit(:combustible, :tipo, :precio)
  end

end
