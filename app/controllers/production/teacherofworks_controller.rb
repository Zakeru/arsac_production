class Production::TeacherofworksController < ApplicationController
  # GET /teacherofworks
  # GET /teacherofworks.json
  def index
    @teacherofworks = Teacherofwork.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teacherofworks }
    end
  end

  # GET /teacherofworks/1
  # GET /teacherofworks/1.json
  def show
    @teacherofwork = Teacherofwork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teacherofwork }
    end
  end

  # GET /teacherofworks/new
  # GET /teacherofworks/new.json
  def new
    @teacherofwork = Teacherofwork.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teacherofwork }
    end
  end

  # GET /teacherofworks/1/edit
  def edit
    @teacherofwork = Teacherofwork.find(params[:id])
  end

  # POST /teacherofworks
  # POST /teacherofworks.json
  def create
    @teacherofwork = Teacherofwork.new(teacherofwork_parameters)

    respond_to do |format|
      if @teacherofwork.save
        format.html { redirect_to production_teacherofwork_path(@teacherofwork), notice: 'teacherofwork was successfully created.' }
        format.json { render json: @teacherofwork, status: :created, location: @teacherofwork }
      else
        format.html { render action: "new" }
        format.json { render json: @teacherofwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teacherofworks/1
  # PUT /teacherofworks/1.json
  def update
    @teacherofwork = Teacherofwork.find(params[:id])

    respond_to do |format|
      if @teacherofwork.update_attributes(teacherofwork_parameters)
        format.html { redirect_to production_teacherofwork_path(@teacherofwork), notice: 'teacherofwork was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teacherofwork.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teacherofworks/1
  # DELETE /teacherofworks/1.json
  def destroy
    @teacherofwork = Teacherofwork.find(params[:id])
    @teacherofwork.destroy

    respond_to do |format|
      format.html { redirect_to production_teacherofworks_url }
      format.json { head :no_content }
    end
  end

  private
  def teacherofwork_parameters
    params.require(:teacherofwork).permit(:banco_1, :correo, :entity_id, :foto, :chiefoffront_id, :movil, :nacimiento, :ruc, :telefono)
  end

end
