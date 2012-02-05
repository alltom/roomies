class Admin::ResidentsController < Admin::AdminController
  def index
    @residents = Resident.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @residentss }
    end
  end

  def show
    @resident = Resident.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resident }
    end
  end

  def new
    @resident = Resident.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resident }
    end
  end

  def edit
    @resident = Resident.find(params[:id])
  end

  def create
    @resident = Resident.new(params[:resident])

    respond_to do |format|
      if @resident.save
        format.html { redirect_to admin_resident_path(@resident), notice: 'Resident was successfully created.' }
        format.json { render json: @resident, status: :created, location: @resident }
      else
        format.html { render action: "new" }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @resident = Resident.find(params[:id])

    respond_to do |format|
      if @resident.update_attributes(params[:resident])
        format.html { redirect_to admin_resident_path(@resident), notice: 'Resident was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resident.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resident = Resident.find(params[:id])
    @resident.destroy

    respond_to do |format|
      format.html { redirect_to admin_residents_url }
      format.json { head :no_content }
    end
  end
end
