class Production::EquipmentregistersController < ApplicationController
  def index    
    @equipmentregisters = Equipmentregister.paginate(:page => params[:page], :per_page => 20).order('id Desc')

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentregisters }
    end
  end

  def show
    @equipmentregister = Equipmentregister.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentregister }
    end
  end

  def new
    @equipmentregister = Equipmentregister.new

    respond_to do |format|
      format.html 
      format.json { render json: @equipmentregister }
    end
  end

  def edit
    @equipmentregister = Equipmentregister.find(params[:id])
  end

  def create
    @equipmentregister = Equipmentregister.new(params[:equipmentregister])

    respond_to do |format|
      if @equipmentregister.save
        format.html { redirect_to @equipmentregister, notice: 'equipmentregister was successfully created.' }
        format.json { render json: @equipmentregister, status: :created, location: @equipmentregister }
      else
        format.html { render action: "new" }
        format.json { render json: @equipmentregister.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @equipmentregister = Equipmentregister.find(params[:id])

    respond_to do |format|
      if @equipmentregister.update_attributes(params[:equipmentregister])
        format.html { redirect_to @equipmentregister, notice: 'equipmentregister was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @equipmentregister.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @equipmentregister = Equipmentregister.find(params[:id])
    @equipmentregister.destroy

    respond_to do |format|
      format.html { redirect_to equipmentregisters_url }
      format.json { head :no_content }
    end
  end

  def equipmentregister_parameters
    params.require(:equipmentregister).permit(:cantidad, :groupsofwork_id, :fin, :inicio, :itemsofcontrol_id, :partofequipment_id, :front_id)
  end
end
