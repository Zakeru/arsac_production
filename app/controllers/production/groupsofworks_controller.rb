class Production::GroupsofworksController < ApplicationController
  def index
    @groupsofworks = Groupsofwork.order('id Desc')

    respond_to do |format|
      format.html
      format.json { render json: @groupsofworks }
    end
  end

  def show
    @groupsofwork = Groupsofwork.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @groupsofwork }
    end
  end

  def new
    @groupsofwork = Groupsofwork.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @groupsofwork }
    end
  end

  def edit
    @groupsofwork = Groupsofwork.find(params[:id])
  end

  def create
    @groupsofwork = Groupsofwork.new(groupsofwork_parameters)

    respond_to do |format|
      if @groupsofwork.save
        format.html { redirect_to production_groupsofwork_path(@groupsofwork), notice: 'Gruposdetrabajo was successfully created.' }
        format.json { render json: @groupsofwork, status: :created, location: @groupsofwork }
      else
        format.html { render action: "new" }
        format.json { render json: @groupsofwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @groupsofwork = Groupsofwork.find(params[:id])

    respond_to do |format|
      if @groupsofwork.update_attributes(groupsofwork_parameters)
        format.html { redirect_to production_groupsofwork_path(@groupsofwork), notice: 'Gruposdetrabajo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @groupsofwork.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @groupsofwork = Groupsofwork.find(params[:id])
    @groupsofwork.destroy

    respond_to do |format|
      format.html { redirect_to production_groupsofworks_url }
      format.json { head :no_content }
    end
  end

  private
  def groupsofwork_parameters
    params.require(:groupsofwork).permit(:sector_id, :subsector_id, :chiefoffront_id, :subcontract_id, :teacherofwork_id, :activo)
  end

end
