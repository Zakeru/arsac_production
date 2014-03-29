class Production::InputofequipmentsController < ApplicationController

  def index
    @inputofequipments = Inputofequipment.all

    respond_to do |format|
      format.html
      format.json { render json: @inputofequipments }
    end
  end

  def show
    @inputofequipment = Inputofequipment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @inputofequipment }
    end
  end

  def new
    @inputofequipment = Inputofequipment.new

    respond_to do |format|
      format.html 
      format.json { render json: @inputofequipment }
    end
  end
  
  def edit
    @inputofequipment = Inputofequipment.find(params[:id])
  end

  def create
    @inputofequipment = Inputofequipment.new(inputofequipment_parameters)

    respond_to do |format|
      if @inputofequipment.save
        format.html { redirect_to production_inputofequipment_path(@inputofequipment), notice: 'inputofequipment was successfully created.' }
        format.json { render json: @inputofequipment, status: :created, location: @inputofequipment }
      else
        format.html { render action: "new" }
        format.json { render json: @inputofequipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @inputofequipment = Inputofequipment.find(params[:id])

    respond_to do |format|
      if @inputofequipment.update_attributes(inputofequipment_parameters)
        format.html { redirect_to production_inputofequipment_path(@inputofequipment), notice: 'inputofequipment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inputofequipment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inputofequipment = Inputofequipment.find(params[:id])
    @inputofequipment.destroy

    respond_to do |format|
      format.html { redirect_to production_inputofequipments_url }
      format.json { head :no_content }
    end
  end

  private
  def inputofequipment_parameters
    params.require(:inputofequipment).permit(:cantidad, :codigo_tobi, :nombre, :precio, :unit_id)
  end

end
