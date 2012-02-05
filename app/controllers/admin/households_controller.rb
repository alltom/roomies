class Admin::HouseholdsController < Admin::AdminController
  def index
    @households = Household.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @households }
    end
  end

  def show
    @household = Household.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @household }
    end
  end

  def new
    @household = Household.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @household }
    end
  end

  def edit
    @household = Household.find(params[:id])
  end

  def create
    @household = Household.new(params[:household])

    respond_to do |format|
      if @household.save
        format.html { redirect_to admin_household_path(@household), notice: 'Household was successfully created.' }
        format.json { render json: @household, status: :created, location: @household }
      else
        format.html { render action: "new" }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @household = Household.find(params[:id])

    respond_to do |format|
      if @household.update_attributes(params[:household])
        format.html { redirect_to admin_household_path(@household), notice: 'Household was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @household.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @household = Household.find(params[:id])
    @household.destroy

    respond_to do |format|
      format.html { redirect_to admin_households_url }
      format.json { head :no_content }
    end
  end
end
