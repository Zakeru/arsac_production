class Production::TareosgruposdetrabajosController < ApplicationController
  # GET /tareosgruposdetrabajos
  # GET /tareosgruposdetrabajos.json
  def index
    @tareosgruposdetrabajos = Tareosgruposdetrabajo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tareosgruposdetrabajos }
    end
  end

  # GET /tareosgruposdetrabajos/1
  # GET /tareosgruposdetrabajos/1.json
  def show
    @tareosgruposdetrabajo = Tareosgruposdetrabajo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tareosgruposdetrabajo }
    end
  end

  # GET /tareosgruposdetrabajos/new
  # GET /tareosgruposdetrabajos/new.json
  def new
    @tareosgruposdetrabajo = Tareosgruposdetrabajo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tareosgruposdetrabajo }
    end
  end

  # GET /tareosgruposdetrabajos/1/edit
  def edit
    @tareosgruposdetrabajo = Tareosgruposdetrabajo.find(params[:id])
  end

  # POST /tareosgruposdetrabajos
  # POST /tareosgruposdetrabajos.json
  def create
    @tareosgruposdetrabajo = Tareosgruposdetrabajo.new(params[:tareosgruposdetrabajo])

    respond_to do |format|
      if @tareosgruposdetrabajo.save
        format.html { redirect_to @tareosgruposdetrabajo, notice: 'Tareosgruposdetrabajo was successfully created.' }
        format.json { render json: @tareosgruposdetrabajo, status: :created, location: @tareosgruposdetrabajo }
      else
        format.html { render action: "new" }
        format.json { render json: @tareosgruposdetrabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tareosgruposdetrabajos/1
  # PUT /tareosgruposdetrabajos/1.json
  def update
    @tareosgruposdetrabajo = Tareosgruposdetrabajo.find(params[:id])

    respond_to do |format|
      if @tareosgruposdetrabajo.update_attributes(params[:tareosgruposdetrabajo])
        format.html { redirect_to @tareosgruposdetrabajo, notice: 'Tareosgruposdetrabajo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tareosgruposdetrabajo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareosgruposdetrabajos/1
  # DELETE /tareosgruposdetrabajos/1.json
  def destroy
    @tareosgruposdetrabajo = Tareosgruposdetrabajo.find(params[:id])
    @tareosgruposdetrabajo.destroy

    respond_to do |format|
      format.html { redirect_to tareosgruposdetrabajos_url }
      format.json { head :no_content }
    end
  end

  private
  def tareosgruposdetrabajo_parameters
    params.require(:tareosgruposdetrabajo).permit(:nombre, :tareo_id, :tareoscolumnas_attributes)
  end

end
