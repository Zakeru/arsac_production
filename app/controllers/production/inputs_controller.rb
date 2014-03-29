class Production::InputsController < ApplicationController

  def index
    @inputs = Input.all

    respond_to do |format|
      format.html
      format.json { render json: @inputs }
    end
  end


  def show
    @input = Input.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @input }
    end
  end

  def new
    @input = Input.new

    respond_to do |format|
      format.html 
      format.json { render json: @input }
    end
  end


  def edit
    @input = Input.find(params[:id])
  end

  def create
    @input = Input.new(input_parameters)

    respond_to do |format|
      if @input.save
        format.html { redirect_to production_input_path(@input), notice: 'input was successfully created.' }
        format.json { render json: @input, status: :created, location: @input }
      else
        format.html { render action: "new" }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @input = Input.find(params[:id])

    respond_to do |format|
      if @input.update_attributes(input_parameters)
        format.html { redirect_to production_input_path(@input), notice: 'input was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @input.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @input = Input.find(params[:id])
    @input.destroy

    respond_to do |format|
      format.html { redirect_to production_inputs_url }
      format.json { head :no_content }
    end
  end

  private
  def input_parameters
    params.require(:input).permit(:subcontract_id, :cantidad, :list_id, :descripcion, :parcial, :pu_sin_igv, :unit_id  )
  end

end
