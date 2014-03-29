class Production::ChiefoffrontsController < ApplicationController

  def index
    @chiefoffronts = Chiefoffront.all

    respond_to do |format|
      format.html
      format.json { render json: @chiefoffronts }
    end
  end


  def show
    @chiefoffront = Chiefoffront.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @chiefoffront }
    end
  end

  def new
    @chiefoffront = Chiefoffront.new

    respond_to do |format|
      format.html
      format.json { render json: @chiefoffront }
    end
  end

  
  def edit
    @chiefoffront = Chiefoffront.find(params[:id])
  end


  def create
    @chiefoffront = Chiefoffront.new(chiefoffront_parameters)

    respond_to do |format|
      if @chiefoffront.save
        format.html { redirect_to production_chiefoffront_path(@chiefoffront), notice: 'Jefedefrente was successfully created.' }
        format.json { render json: @chiefoffront, status: :created, location: @chiefoffront }
      else
        format.html { render action: "new" }
        format.json { render json: @chiefoffront.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @chiefoffront = Chiefoffront.find(params[:id])

    respond_to do |format|
      if @chiefoffront.update_attributes(chiefoffront_parameters)
        format.html { redirect_to production_chiefoffront_path(@chiefoffront), notice: 'Jefedefrente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chiefoffront.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @chiefoffront = Chiefoffront.find(params[:id])
    @chiefoffront.destroy

    respond_to do |format|
      format.html { redirect_to production_chiefoffronts_url }
      format.json { head :no_content }
    end
  end

  private
  def chiefoffront_parameters
    params.require(:chiefoffront).permit(:entity_id, :telefono, :movil_1, :movil_2, :mail, :direccion_1, :direccion_2, :foto, :nacimiento, :estado, :descripcion)
  end
end
