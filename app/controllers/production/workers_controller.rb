class Production::WorkersController < ApplicationController
  def index
    @workers = Worker.paginate(:page => params[:page], :per_page => 12).order('id Desc')

    respond_to do |format|
      format.html 
      format.json { render json: @workers }
    end
  end

  def show
    @worker = Worker.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @worker }
    end
  end

  def new
    @worker = Worker.new

    respond_to do |format|
      format.html 
      format.json { render json: @worker }
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def create
    @worker = Worker.new(params[:worker])

    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'worker was successfully created.' }
        format.json { render json: @worker, status: :created, location: @worker }
      else
        format.html { render action: "new" }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @worker = Worker.find(params[:id])

    respond_to do |format|
      if @worker.update_attributes(params[:worker])
        format.html { redirect_to @worker, notice: 'worker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy

    respond_to do |format|
      format.html { redirect_to workers_url }
      format.json { head :no_content }
    end
  end

  private
  def worker_parameters
    params.require(:worker).permit(:partdayliofperson_id, :catalogofwork_id, :catalogcategorywork_id, :itemsofcontrol_id, :normal, :normal_100, :normal_60, :total_horas, :front_id)
  end

end
