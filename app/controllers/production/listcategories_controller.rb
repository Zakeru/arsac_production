class Production::ListcategoriesController < ApplicationController
  def index
    @listcategories = Listcategory.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @listcategories }
    end
  end

  def show
    @listcategory = Listcategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @listcategory }
    end
  end

  def new
    @listcategory = Listcategory.new

    respond_to do |format|
      format.html
      format.json { render json: @listcategory }
    end
  end

  def edit
    @listcategory = Listcategory.find(params[:id])
  end

  def create
    @listcategory = Listcategory.new(listcategory_parameters)

    respond_to do |format|
      if @listcategory.save
        format.html { redirect_to production_listcategory_path(@listcategory), notice: 'Listacategoria was successfully created.' }
        format.json { render json: @listcategory, status: :created, location: @listcategory }
      else
        format.html { render action: "new" }
        format.json { render json: @listcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @listcategory = Listcategory.find(params[:id])

    respond_to do |format|
      if @listcategory.update_attributes(listcategory_parameters)
        format.html { redirect_to production_listcategory_path(@listcategory), notice: 'Listacategoria was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @listcategory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listcategory = Listcategory.find(params[:id])
    @listcategory.destroy

    respond_to do |format|
      format.html { redirect_to production_listcategories_url }
      format.json { head :no_content }
    end
  end



  def importar_partidas
    @listcategory = Listcategory.new(params[:listcategory])    
    @listcategory.save

    #params[:listcategory].each do |k, listacategoria|
    #  @listcategory = Listcategory.new(listacategoria)   
    #  @listcategory.save 
    #end
    redirect_to listcategories_path
  end

  private
  def listcategory_parameters
    params.require(:listcategory).permit(:codigo, :nombre, :importlist_id, :lists_attributes)
  end

end
