class Production::DiasController < ApplicationController
  def index
    @dias = Dia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dias }
    end
  end

  def show
    @dia = Dia.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @dia }
    end
  end

  def new
    @dia = Dia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dia }
    end
  end

  # GET /dias/1/edit
  def edit
    @dia = Dia.find(params[:id])
  end

  def create
    @dia = Dia.new(params[:dia])

    respond_to do |format|
      if @dia.save
        format.html { redirect_to @dia, notice: 'Dia was successfully created.' }
        format.json { render json: @dia, status: :created, location: @dia }
      else
        format.html { render action: "new" }
        format.json { render json: @dia.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @dia = Dia.find(params[:id])

    respond_to do |format|
      if @dia.update_attributes(params[:dia])
        format.html { redirect_to @dia, notice: 'Dia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dia.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @dia = Dia.find(params[:id])
    @dia.destroy

    respond_to do |format|
      format.html { redirect_to dias_url }
      format.json { head :no_content }
    end
  end

  private
  def dia_parameters
    params.require(:dia).permit(:nombre, :numero, :tipodedia_id)
  end
end
