class Production::MaquinariaequiposController < ApplicationController
  # GET /maquinariaequipos
  # GET /maquinariaequipos.json
  def index
    @maquinariaequipos = Maquinariaequipo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @maquinariaequipos }
    end
  end

  # GET /maquinariaequipos/1
  # GET /maquinariaequipos/1.json
  def show
    @maquinariaequipo = Maquinariaequipo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @maquinariaequipo }
    end
  end

  # GET /maquinariaequipos/new
  # GET /maquinariaequipos/new.json
  def new
    @maquinariaequipo = Maquinariaequipo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @maquinariaequipo }
    end
  end

  # GET /maquinariaequipos/1/edit
  def edit
    @maquinariaequipo = Maquinariaequipo.find(params[:id])
  end

  # POST /maquinariaequipos
  # POST /maquinariaequipos.json
  def create
    @maquinariaequipo = Maquinariaequipo.new(params[:maquinariaequipo])

    respond_to do |format|
      if @maquinariaequipo.save
        format.html { redirect_to @maquinariaequipo, notice: 'Maquinariaequipo was successfully created.' }
        format.json { render json: @maquinariaequipo, status: :created, location: @maquinariaequipo }
      else
        format.html { render action: "new" }
        format.json { render json: @maquinariaequipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /maquinariaequipos/1
  # PUT /maquinariaequipos/1.json
  def update
    @maquinariaequipo = Maquinariaequipo.find(params[:id])

    respond_to do |format|
      if @maquinariaequipo.update_attributes(params[:maquinariaequipo])
        format.html { redirect_to @maquinariaequipo, notice: 'Maquinariaequipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @maquinariaequipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maquinariaequipos/1
  # DELETE /maquinariaequipos/1.json
  def destroy
    @maquinariaequipo = Maquinariaequipo.find(params[:id])
    @maquinariaequipo.destroy

    respond_to do |format|
      format.html { redirect_to maquinariaequipos_url }
      format.json { head :no_content }
    end
  end

  private
  def maquinariaequipo
    params.require(:maquinariaequipo).permit(:nombre, :reportedemaquinaria_id, :maquinariaequiporesumenes_attributes, :maquinariaequipodetalles_attributes)
  end

end
