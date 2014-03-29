class Production::SuppliersController < ApplicationController
  # GET /proveedores
  # GET /proveedores.json
  def index
    @suppliers = Supplier.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @suppliers }
    end
  end

  def show
    @supplier = Supplier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @supplier }
    end
  end

  def new
    @supplier = Supplier.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @supplier }
    end
  end

  # GET /proveedores/1/edit
  def edit
    @supplier = Supplier.find(params[:id])
  end

  def create
    @supplier = Supplier.new(supplier_parameters)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to production_supplier_path(@supplier), notice: 'Proveedore was successfully created.' }
        format.json { render json: @supplier, status: :created, location: @supplier }
      else
        format.html { render action: "new" }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @supplier = Supplier.find(params[:id])
    respond_to do |format|
      if @supplier.update_attributes(supplier_parameters)
        format.html { redirect_to production_supplier_path(@supplier), notice: 'Proveedore was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @supplier = Supplier.find(params[:id])
    @supplier.destroy

    respond_to do |format|
      format.html { redirect_to production_suppliers_url }
      format.json { head :no_content }
    end
  end

  private
  def supplier_parameters
    params.require(:supplier).permit(:entity_id, :nombre, :direccion, :telefono, :movil_1, :movil_2, :cuenta_corriente1, :cuenta_corriente2, :cuenta_corriente3, :cuenta_de_detraccion, :contacto, :ruc, :cci_1, :cci_2, :cci_3, :banco_1, :banco_2, :banco_3)
  end

end