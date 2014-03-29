class Production::SubphasesController < ApplicationController

  
  def migrar
    s = Roo::Excel.new("/home/moises/Escritorio/subfases_linux.xls")
	@subfases = []
	@fases = []
	(6..797).each do |fila|
	temp2 = s.cell('B',fila).to_i.to_s.rjust(2,'0')
	temp4 = s.cell('C', fila)
	temp3 = s.cell('A',fila).to_i.to_s.rjust(2,'0')
	fase_id = Fase.find_by_codigo("#{temp3}")
	fase_id_temp = fase_id['id']
	#@subfases.push("#{temp2}")
      	## Obtener codigo de fase
	  	if temp2 == '00'
#			@subfases.push(temp4)

#    	    @subfases.push(fase_id_temp)
	  	end
      	## Celda Actual Subfase
    	#subfase_descripcion = s.cell('C',fila)
		#subfase_codigo		= s.cell('B',fila)
		#if temp2 != '00'
			@guardar_subphases = Subphase.new(:codigo => temp2, :descripcion => temp4, :fase_id => fase_id_temp)
			@guardar_subphases.save
		#end
    end
  end


  def index
	@subphases = Subphase.paginate(:page => params[:page], :per_page => 25).order('id Desc')

    respond_to do |format|
      format.html 
      format.json { render json: @subphases }
    end
  end

  def show
    @subphase = Subphase.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render json: @subphase }
    end
  end

  def new
    @subphase = Subphase.new

    respond_to do |format|
      format.html 
      format.json { render json: @subphase }
    end
  end

  def edit
    @subphase = Subphase.find(params[:id])
  end

  def create
    @subphase = Subphase.new(subphase_parameters)

    respond_to do |format|
      if @subphase.save
        format.html { redirect_to production_subphase_path(@subphase), notice: 'subphase was successfully created.' }
        format.json { render json: @subphase, status: :created, location: @subphase }
      else
        format.html { render action: "new" }
        format.json { render json: @subphase.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @subphase = Subphase.find(params[:id])

    respond_to do |format|
      if @subphase.update_attributes(subphase_parameters)
        format.html { redirect_to production_subphase_path(@subphase), notice: 'subphase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subphase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @subphase = Subphase.find(params[:id])
    @subphase.destroy

    respond_to do |format|
      format.html { redirect_to production_subphases_url }
      format.json { head :no_content }
    end
  end

  private
  def subphase_parameters
    params.require(:subphase).permit(:codigo, :descripcion, :phase_id)
  end

end
