class Production::TareoscolumnasController < ApplicationController
  # GET /tareoscolumnas
  # GET /tareoscolumnas.json
  def index
    @tareoscolumnas = Tareoscolumna.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tareoscolumnas }
    end
  end

  # GET /tareoscolumnas/1
  # GET /tareoscolumnas/1.json
  def show
    @tareoscolumna = Tareoscolumna.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tareoscolumna }
    end
  end

  # GET /tareoscolumnas/new
  # GET /tareoscolumnas/new.json
  def new
    @tareoscolumna = Tareoscolumna.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tareoscolumna }
    end
  end

  # GET /tareoscolumnas/1/edit
  def edit
    @tareoscolumna = Tareoscolumna.find(params[:id])
  end

  # POST /tareoscolumnas
  # POST /tareoscolumnas.json
  def create
    @tareoscolumna = Tareoscolumna.new(params[:tareoscolumna])

    respond_to do |format|
      if @tareoscolumna.save
        format.html { redirect_to @tareoscolumna, notice: 'Tareoscolumna was successfully created.' }
        format.json { render json: @tareoscolumna, status: :created, location: @tareoscolumna }
      else
        format.html { render action: "new" }
        format.json { render json: @tareoscolumna.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tareoscolumnas/1
  # PUT /tareoscolumnas/1.json
  def update
    @tareoscolumna = Tareoscolumna.find(params[:id])

    respond_to do |format|
      if @tareoscolumna.update_attributes(params[:tareoscolumna])
        format.html { redirect_to @tareoscolumna, notice: 'Tareoscolumna was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tareoscolumna.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareoscolumnas/1
  # DELETE /tareoscolumnas/1.json
  def destroy
    @tareoscolumna = Tareoscolumna.find(params[:id])
    @tareoscolumna.destroy

    respond_to do |format|
      format.html { redirect_to tareoscolumnas_url }
      format.json { head :no_content }
    end
  end

  private
  def tareoscolumna_parameters
    params.require(:tareoscolumna).permit(:item, :tareosgruposdetrabajo_id, :tareosfilas_attributes)
  end

end
