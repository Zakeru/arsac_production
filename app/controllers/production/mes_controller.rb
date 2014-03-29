class Production::MesController < ApplicationController
  # GET /mes
  # GET /mes.json
  def index
    @mes = Me.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @mes }
    end
  end

  # GET /mes/1
  # GET /mes/1.json
  def show
    @me = Me.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @me }
    end
  end

  # GET /mes/new
  # GET /mes/new.json
  def new
    @me = Me.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @me }
    end
  end

  # GET /mes/1/edit
  def edit
    @me = Me.find(params[:id])
  end

  # POST /mes
  # POST /mes.json
  def create
    @me = Me.new(params[:me])

    respond_to do |format|
      if @me.save
        format.html { redirect_to @me, notice: 'Me was successfully created.' }
        format.json { render json: @me, status: :created, location: @me }
      else
        format.html { render action: "new" }
        format.json { render json: @me.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /mes/1
  # PUT /mes/1.json
  def update
    @me = Me.find(params[:id])

    respond_to do |format|
      if @me.update_attributes(params[:me])
        format.html { redirect_to @me, notice: 'Me was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @me.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mes/1
  # DELETE /mes/1.json
  def destroy
    @me = Me.find(params[:id])
    @me.destroy

    respond_to do |format|
      format.html { redirect_to mes_url }
      format.json { head :no_content }
    end
  end

  private
  def me_parameters
    params.require(:me).permit(:nombre, :numero)
  end


end
