class Production::ListsController < ApplicationController
  # GET /listas
  # GET /listas.json
  require 'csv'
  require 'iconv'  
  def migrar    
    #s = Roo::Excel.new('D:/\partidas_copia.xls')    
    #listacategoria_id = 0 
    #(2..85).each do |fila|
    #  codigo = s.cell('A',fila).to_s
    #  nombre = s.cell('B',fila)
    #  unidad = s.cell('C',fila)
    #  precio_unitario = s.cell('D',fila).to_f.round(2)
    #  if codigo[6,7] == '00'
    #    listacategoria_id = listacategoria_id +1
    #  end

    #  if codigo[6,7] != '00'
    #    lista = List.new(:codigo => codigo, :nombre => nombre, :unidad => unidad, :precio_unitario => precio_unitario, :listacategoria_id => listacategoria_id)
    #    List.save
    #  end
    #end
  end

  def import
    
  end

  def index
    #@lists = List.search(params[:search], params[:page])
    #@lists = List.where('lower(nombre) like ?',"%#{params[:search]}%").paginate(:page => params[:page], :per_page => 25).order('id Desc')
    @lists = List.where('lower(nombre) like ?',"%#{params[:search]}%").order('id Desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lists }
    end
  end

  def show
    @list = List.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @list }
    end
  end

  # GET /listas/new
  # GET /listas/new.json
  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @list }
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def create
    @list = List.new(list_parameters)

    respond_to do |format|
      if @list.save
        format.html { redirect_to production_list_path(@list), notice: 'Lista was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(list_parameters)
        format.html { redirect_to production_list_path(@list), notice: 'Lista was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @list = List.find(params[:id])
    @partidas = Item.where('list_id = ?', params[:id])
    if @partidas.count == 0
      @list.destroy
      redirect_to production_lists_path, notice: 'La partida se ha Eliminado Correctamente.'
    else
      redirect_to production_lists_path, notice: 'No se puede eliminar por que esta partida esta siendo usada en ParteObra'
    end
    
  end

  private
  def list_parameters
    params.require(:list).permit(:codigo, :nombre, :unit_id, :precio_unitario, :listcategory_id)
  end

end
