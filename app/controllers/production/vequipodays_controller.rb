class Production::VequipodaysController < ApplicationController
  # GET /vequipodays
  # GET /vequipodays.json
  def index
    @vequipodays = Vequipoday.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vequipodays }
    end
  end

  # GET /vequipodays/1
  # GET /vequipodays/1.json
  def show
    @vequipoday = Vequipoday.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vequipoday }
    end
  end

  # GET /vequipodays/new
  # GET /vequipodays/new.json
  def new
    @vequipoday = Vequipoday.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vequipoday }
    end
  end

  # GET /vequipodays/1/edit
  def edit
    @vequipoday = Vequipoday.find(params[:id])
  end

  # POST /vequipodays
  # POST /vequipodays.json
  def create
    @vequipoday = Vequipoday.new(params[:vequipoday])

    respond_to do |format|
      if @vequipoday.save
        format.html { redirect_to @vequipoday, notice: 'Vequipoday was successfully created.' }
        format.json { render json: @vequipoday, status: :created, location: @vequipoday }
      else
        format.html { render action: "new" }
        format.json { render json: @vequipoday.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vequipodays/1
  # PUT /vequipodays/1.json
  def update
    @vequipoday = Vequipoday.find(params[:id])

    respond_to do |format|
      if @vequipoday.update_attributes(params[:vequipoday])
        format.html { redirect_to @vequipoday, notice: 'Vequipoday was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vequipoday.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vequipodays/1
  # DELETE /vequipodays/1.json
  def destroy
    @vequipoday = Vequipoday.find(params[:id])
    @vequipoday.destroy

    respond_to do |format|
      format.html { redirect_to vequipodays_url }
      format.json { head :no_content }
    end
  end

  private
  def vequipoday_parameters
    params.require(:vequipoday).permit(:combustible, :fecha, :hora_fin, :hora_inicio, :horas_efectivas, :horas_horas, :numero_parte, :suministro)
  end

end
