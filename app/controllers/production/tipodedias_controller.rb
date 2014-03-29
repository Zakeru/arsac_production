class Production::TipodediasController < ApplicationController
  # GET /tipodedias
  # GET /tipodedias.json
  def index
    @tipodedias = Tipodedia.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipodedias }
    end
  end

  # GET /tipodedias/1
  # GET /tipodedias/1.json
  def show
    @tipodedia = Tipodedia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipodedia }
    end
  end

  # GET /tipodedias/new
  # GET /tipodedias/new.json
  def new
    @tipodedia = Tipodedia.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipodedia }
    end
  end

  # GET /tipodedias/1/edit
  def edit
    @tipodedia = Tipodedia.find(params[:id])
  end

  # POST /tipodedias
  # POST /tipodedias.json
  def create
    @tipodedia = Tipodedia.new(params[:tipodedia])

    respond_to do |format|
      if @tipodedia.save
        format.html { redirect_to @tipodedia, notice: 'Tipodedia was successfully created.' }
        format.json { render json: @tipodedia, status: :created, location: @tipodedia }
      else
        format.html { render action: "new" }
        format.json { render json: @tipodedia.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipodedias/1
  # PUT /tipodedias/1.json
  def update
    @tipodedia = Tipodedia.find(params[:id])

    respond_to do |format|
      if @tipodedia.update_attributes(params[:tipodedia])
        format.html { redirect_to @tipodedia, notice: 'Tipodedia was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipodedia.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipodedias/1
  # DELETE /tipodedias/1.json
  def destroy
    @tipodedia = Tipodedia.find(params[:id])
    @tipodedia.destroy

    respond_to do |format|
      format.html { redirect_to tipodedias_url }
      format.json { head :no_content }
    end
  end


  private
  def tipodedia_parameters
    params.require(:tipodedia).permit(:nombre)
  end

end
