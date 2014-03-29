class Production::VmanodeobrasController < ApplicationController
  # GET /vmanodeobras
  # GET /vmanodeobras.json
  def index
    @vmanodeobras = Vmanodeobra.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vmanodeobras }
    end
  end

  # GET /vmanodeobras/1
  # GET /vmanodeobras/1.json
  def show
    @vmanodeobra = Vmanodeobra.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vmanodeobra }
    end
  end

  # GET /vmanodeobras/new
  # GET /vmanodeobras/new.json
  def new
    @vmanodeobra = Vmanodeobra.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vmanodeobra }
    end
  end

  # GET /vmanodeobras/1/edit
  def edit
    @vmanodeobra = Vmanodeobra.find(params[:id])
  end

  # POST /vmanodeobras
  # POST /vmanodeobras.json
  def create
    @vmanodeobra = Vmanodeobra.new(params[:vmanodeobra])

    respond_to do |format|
      if @vmanodeobra.save
        format.html { redirect_to @vmanodeobra, notice: 'Vmanodeobra was successfully created.' }
        format.json { render json: @vmanodeobra, status: :created, location: @vmanodeobra }
      else
        format.html { render action: "new" }
        format.json { render json: @vmanodeobra.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vmanodeobras/1
  # PUT /vmanodeobras/1.json
  def update
    @vmanodeobra = Vmanodeobra.find(params[:id])

    respond_to do |format|
      if @vmanodeobra.update_attributes(params[:vmanodeobra])
        format.html { redirect_to @vmanodeobra, notice: 'Vmanodeobra was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vmanodeobra.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vmanodeobras/1
  # DELETE /vmanodeobras/1.json
  def destroy
    @vmanodeobra = Vmanodeobra.find(params[:id])
    @vmanodeobra.destroy

    respond_to do |format|
      format.html { redirect_to vmanodeobras_url }
      format.json { head :no_content }
    end
  end

  private
  def vmanodeobra_parameters
    params.require(:vmanodeobra).permit(:cantidad, :nombre, :parcial, :precio_unitario, :unidad, :valorizacione_id)
  end

end
