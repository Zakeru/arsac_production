class Production::YearsController < ApplicationController
  # GET /anhos
  # GET /anhos.json
  def index
    @years = Year.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @years }
    end
  end

  # GET /anhos/1
  # GET /anhos/1.json
  def show
    @year = Year.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @year }
    end
  end

  # GET /anhos/new
  # GET /anhos/new.json
  def new
    @year = Year.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @year }
    end
  end

  # GET /anhos/1/edit
  def edit
    @year = Year.find(params[:id])
  end

  # POST /anhos
  # POST /anhos.json
  def create
    @year = Year.new(year_parameters)

    respond_to do |format|
      if @year.save
        format.html { redirect_to production_year_path(@year), notice: 'Anho was successfully created.' }
        format.json { render json: @year, status: :created, location: @year }
      else
        format.html { render action: "new" }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /anhos/1
  # PUT /anhos/1.json
  def update
    @year = Year.find(params[:id])

    respond_to do |format|
      if @year.update_attributes(year_parameters)
        format.html { redirect_to production_year_path(@year), notice: 'Anho was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @year.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anhos/1
  # DELETE /anhos/1.json
  def destroy
    @year = Year.find(params[:id])
    @year.destroy

    respond_to do |format|
      format.html { redirect_to production_years_url }
      format.json { head :no_content }
    end
  end

  private
  def year_parameters
    params.require(:year).permit(:nombre)
  end
end
