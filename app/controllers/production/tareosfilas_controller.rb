class Production::TareosfilasController < ApplicationController
  # GET /tareosfilas
  # GET /tareosfilas.json
  def index
    @tareosfilas = Tareosfila.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tareosfilas }
    end
  end

  # GET /tareosfilas/1
  # GET /tareosfilas/1.json
  def show
    @tareosfila = Tareosfila.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tareosfila }
    end
  end

  # GET /tareosfilas/new
  # GET /tareosfilas/new.json
  def new
    @tareosfila = Tareosfila.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tareosfila }
    end
  end

  # GET /tareosfilas/1/edit
  def edit
    @tareosfila = Tareosfila.find(params[:id])
  end

  # POST /tareosfilas
  # POST /tareosfilas.json
  def create
    @tareosfila = Tareosfila.new(params[:tareosfila])

    respond_to do |format|
      if @tareosfila.save
        format.html { redirect_to @tareosfila, notice: 'Tareosfila was successfully created.' }
        format.json { render json: @tareosfila, status: :created, location: @tareosfila }
      else
        format.html { render action: "new" }
        format.json { render json: @tareosfila.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tareosfilas/1
  # PUT /tareosfilas/1.json
  def update
    @tareosfila = Tareosfila.find(params[:id])

    respond_to do |format|
      if @tareosfila.update_attributes(params[:tareosfila])
        format.html { redirect_to @tareosfila, notice: 'Tareosfila was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tareosfila.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tareosfilas/1
  # DELETE /tareosfilas/1.json
  def destroy
    @tareosfila = Tareosfila.find(params[:id])
    @tareosfila.destroy

    respond_to do |format|
      format.html { redirect_to tareosfilas_url }
      format.json { head :no_content }
    end
  end

  private
  def tareosfila_parameters
    params.require(:tareosfila).permit(:item, :tareoscolumna_id)
  end


end
