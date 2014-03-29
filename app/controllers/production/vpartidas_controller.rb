class Production::VpartidasController < ApplicationController
  # GET /vpartidas
  # GET /vpartidas.json
  def index
    @vpartidas = Vpartida.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vpartidas }
    end
  end

  # GET /vpartidas/1
  # GET /vpartidas/1.json
  def show
    @vpartida = Vpartida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vpartida }
    end
  end

  # GET /vpartidas/new
  # GET /vpartidas/new.json
  def new
    @vpartida = Vpartida.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vpartida }
    end
  end

  # GET /vpartidas/1/edit
  def edit
    @vpartida = Vpartida.find(params[:id])
  end

  # POST /vpartidas
  # POST /vpartidas.json
  def create
    @vpartida = Vpartida.new(params[:vpartida])

    respond_to do |format|
      if @vpartida.save
        format.html { redirect_to @vpartida, notice: 'Vpartida was successfully created.' }
        format.json { render json: @vpartida, status: :created, location: @vpartida }
      else
        format.html { render action: "new" }
        format.json { render json: @vpartida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vpartidas/1
  # PUT /vpartidas/1.json
  def update
    @vpartida = Vpartida.find(params[:id])

    respond_to do |format|
      if @vpartida.update_attributes(params[:vpartida])
        format.html { redirect_to @vpartida, notice: 'Vpartida was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vpartida.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vpartidas/1
  # DELETE /vpartidas/1.json
  def destroy
    @vpartida = Vpartida.find(params[:id])
    @vpartida.destroy

    respond_to do |format|
      format.html { redirect_to vpartidas_url }
      format.json { head :no_content }
    end
  end

  private
  def vpartida_parameters
    params.require(:vpartida).permit(:cantidad, :codigo, :parcial, :partida_nombre, :precio_unitario, :unidad, :valorizacione_id)
  end

end
