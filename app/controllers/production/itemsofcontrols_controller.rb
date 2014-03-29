class Production::ItemsofcontrolsController < ApplicationController

  def index    
    @itemsofcontrols = Itemsofcontrol.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html
      format.json { render json: @itemsofcontrols }
    end
  end


  def show
    @itemsofcontrol = Itemsofcontrol.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @itemsofcontrol }
    end
  end

  def new
    @itemsofcontrol = Itemsofcontrol.new

    @phases = Phase.all

    respond_to do |format|
      format.html 
      format.json { render json: @itemsofcontrol }
    end
  end


  def edit
    @itemsofcontrol = Itemsofcontrol.find(params[:id])
    @phases = Phase.all
  end


  def create
    @itemsofcontrol = Itemsofcontrol.new(itemsofcontrol_parameters)

    

    respond_to do |format|
      if @itemsofcontrol.save
        format.html { redirect_to production_itemsofcontrol_path(@itemsofcontrol), notice: 'itemsofcontrol was successfully created.' }
        format.json { render json: @itemsofcontrol, status: :created, location: @itemsofcontrol }
      else
        format.html { render action: "new" }
        format.json { render json: @itemsofcontrol.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @itemsofcontrol = Itemsofcontrol.find(params[:id])

    respond_to do |format|
      if @itemsofcontrol.update_attributes(itemsofcontrol_parameters)
        format.html { redirect_to production_itemsofcontrol_path(@itemsofcontrol), notice: 'itemsofcontrol was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @itemsofcontrol.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @itemsofcontrol = Itemsofcontrol.find(params[:id])
    @itemsofcontrol.destroy

    respond_to do |format|
      format.html { redirect_to production_itemsofcontrols_url }
      format.json { head :no_content }
    end
  end

  def valuesubfase
    id = params[:id]
    @subfases = Subphase.where(phase_id: id).all

    respond_to do |format|
      format.html {render :layout => 'select'}
    end
  end

  def mostrar
    id = params[:id]
    @subsectores = Subsector.where(sector_id: id).all
    
    respond_to do |format|
      format.html {render :layout => 'select'}
    end    
  end

  private
  def itemsofcontrol_parameters
    params.require(:itemsofcontrol).permit(:phase_id, :subphase_id, :subsector_id, :sector_id)
  end

end
