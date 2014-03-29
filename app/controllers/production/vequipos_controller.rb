class Production::VequiposController < ApplicationController
  # GET /vequipos
  # GET /vequipos.json
  def index
    @vequipos = Vequipo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vequipos }
    end
  end

  # GET /vequipos/1
  # GET /vequipos/1.json
  def show
    @vequipo = Vequipo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vequipo }
    end
  end

  # GET /vequipos/new
  # GET /vequipos/new.json
  def new
    @vequipo = Vequipo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vequipo }
    end
  end

  # GET /vequipos/1/edit
  def edit
    @vequipo = Vequipo.find(params[:id])
  end

  # POST /vequipos
  # POST /vequipos.json
  def create
    @vequipo = Vequipo.new(params[:vequipo])

    respond_to do |format|
      if @vequipo.save
        format.html { redirect_to @vequipo, notice: 'Vequipo was successfully created.' }
        format.json { render json: @vequipo, status: :created, location: @vequipo }
      else
        format.html { render action: "new" }
        format.json { render json: @vequipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vequipos/1
  # PUT /vequipos/1.json
  def update
    @vequipo = Vequipo.find(params[:id])

    respond_to do |format|
      if @vequipo.update_attributes(params[:vequipo])
        format.html { redirect_to @vequipo, notice: 'Vequipo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vequipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vequipos/1
  # DELETE /vequipos/1.json
  def destroy
    @vequipo = Vequipo.find(params[:id])
    @vequipo.destroy

    respond_to do |format|
      format.html { redirect_to vequipos_url }
      format.json { head :no_content }
    end
  end

  private
  def vequipo_parameters
    params.require(:vequipo).permit(attr_accessible :cantidad, :nombre, :parcial, :precio_unitario, :unidad, :valorizacione_id, :equiposdesubcontrato_id, :vequipodays_attributes)
  end

end
