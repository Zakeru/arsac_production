class Production::PhasesController < ApplicationController

  def index
    @phases = Phase.paginate(:page => params[:page], :per_page => 20).order('id Desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phases }
    end
  end


  def show
    @phase = Phase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phase }
    end
  end


  def new
    @phase = Phase.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phase }
    end
  end


  def edit
    @phase = Phase.find(params[:id])
  end


  def create
    @phase = Phase.new(phase_parameters)

    respond_to do |format|
      if @phase.save
        format.html { redirect_to production_phase_path(@phase), notice: 'phase was successfully created.' }
        format.json { render json: @phase, status: :created, location: @phase }
      else
        format.html { render action: "new" }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @phase = Phase.find(params[:id])

    respond_to do |format|
      if @phase.update_attributes(phase_parameters)
        format.html { redirect_to production_phase_path(@phase), notice: 'phase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phase.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @phase = Phase.find(params[:id])
    @phase.destroy

    respond_to do |format|
      format.html { redirect_to production_phases_url }
      format.json { head :no_content }
    end
  end

  private
  def phase_parameters
    params.require(:phase).permit(:codigo, :descripcion)
  end
end
