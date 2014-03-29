class Production::SubcontractsController < ApplicationController

  def index
    @subcontracts = Subcontract.all

    respond_to do |format|
      format.html
      format.json { render json: @subcontracts }
    end
  end


  def show
    @subcontract = Subcontract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @subcontract }
    end
  end


  def new
    @subcontract = Subcontract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @subcontract }
    end
  end


  def edit
    @subcontract = Subcontract.find(params[:id])
  end


  def create    
    @subcontract = Subcontract.new(subcontract_parameters)

    respond_to do |format|
      if @subcontract.save
        format.html { redirect_to production_subcontract_path(@subcontract), notice: 'subcontract was successfully created.' }
        format.json { render json: @subcontract, status: :created, location: @subcontract }
      else
        format.html { render action: "new" }
        format.json { render json: @subcontract.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @subcontract = Subcontract.find(params[:id])

    respond_to do |format|
      if @subcontract.update_attributes(subcontract_parameters)
        format.html { redirect_to production_subcontract_path(@subcontract), notice: 'subcontract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subcontract.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @subcontract = Subcontract.find(params[:id])
    @subcontract.destroy

    respond_to do |format|
      format.html { redirect_to production_subcontracts_url }
      format.json { head :no_content }
    end
  end

  private
  def subcontract_parameters
    params.require(:subcontract).permit!
  end

end
