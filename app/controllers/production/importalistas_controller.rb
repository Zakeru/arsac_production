class Production::ImportalistasController < ApplicationController
  def index
    @importalistas = Importalista.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @importalistas }
    end
  end

  def show
    @importalista = Importalista.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @importalista }
    end
  end

  def new
    @importalista = Importalista.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @importalista }
    end
  end

  def edit
    @importalista = Importalista.find(params[:id])
  end

  def create
    @importalista = Importalista.new(params[:importalista])

    respond_to do |format|
      if @importalista.save
        format.html { redirect_to @importalista, notice: 'Importalista was successfully created.' }
        format.json { render json: @importalista, status: :created, location: @importalista }
      else
        format.html { render action: "new" }
        format.json { render json: @importalista.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @importalista = Importalista.find(params[:id])

    respond_to do |format|
      if @importalista.update_attributes(params[:importalista])
        format.html { redirect_to @importalista, notice: 'Importalista was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @importalista.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @importalista = Importalista.find(params[:id])
    @importalista.destroy

    respond_to do |format|
      format.html { redirect_to importalistas_url }
      format.json { head :no_content }
    end
  end

  def import
    @importalista = Importalista.new(params[:importalista])
    @importalista.save
    redirect_to listas_path
  end

  private
  def importalista_parameters
    params.require(:importalista).permit(:nombre, :listacategorias_attributes)
  end
end
