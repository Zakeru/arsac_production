class Production::FrontsController < ApplicationController
  def index
    @fronts = Front.all

    respond_to do |format|
      format.html
      format.json { render json: @fronts }
    end
  end


  def show
    @front = Front.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @front }
    end
  end


  def new
    @front = Front.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @front }
    end
  end


  def edit
    @front = Front.find(params[:id])
  end


  def create
    @front = Front.new(front_parameters)

    respond_to do |format|
      if @front.save
        format.html { redirect_to production_front_path(@front), notice: 'Frente was successfully created.' }
        format.json { render json: @front, status: :created, location: @front }
      else
        format.html { render action: "new" }
        format.json { render json: @front.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @front = Front.find(params[:id])

    respond_to do |format|
      if @front.update_attributes(front_parameters)
        format.html { redirect_to production_front_path(@front), notice: 'Frente was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @front.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @front = Front.find(params[:id])
    @front.destroy

    respond_to do |format|
      format.html { redirect_to production_fronts_url }
      format.json { head :no_content }
    end
  end

  private
  def front_parameters
    params.require(:front).permit(:descripcion, :nombre)
  end

end
