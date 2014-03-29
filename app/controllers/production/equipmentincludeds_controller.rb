class Production::EquipmentincludedsController < ApplicationController
  def index
    @equipmentincludeds = Equipmentincluded.all

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentincludeds }
    end
  end

  def show
    @equipmentincluded = Equipmentincluded.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentincluded }
    end
  end

  def new
    @equipmentincluded = Equipmentincluded.new

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentincluded }
    end
  end

  def edit
    @equipmentincluded = Equipmentincluded.find(params[:id])
  end

  def create
    @equipmentincluded = Equipmentincluded.new(equipmentincluded_parameters)

    respond_to do |format|
      if @equipmentincluded.save
        format.html { redirect_to production_equipmentincluded_path(@equipmentincluded), notice: 'equipmentincluded was successfully created.' }
        format.json { render json: @equipmentincluded, status: :created, location: @equipmentincluded }
      else
        format.html { render action: "new" }
        format.json { render json: @equipmentincluded.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @equipmentincluded = Equipmentincluded.find(params[:id])

    respond_to do |format|
      if @equipmentincluded.update_attributes(equipmentincluded_parameters)
        format.html { redirect_to production_equipmentincluded_path(@equipmentincluded), notice: 'equipmentincluded was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipmentincluded.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @equipmentincluded = Equipmentincluded.find(params[:id])
    @equipmentincluded.destroy

    respond_to do |format|
      format.html { redirect_to production_equipmentincludeds_url }
      format.json { head :no_content }
    end
  end

  private
  def equipmentincluded_parameters
    params.require(:equipmentincluded).permit(:nombre)
  end
end
