class ChoreInstancesController < ApplicationController
  # GET /chore_instances
  # GET /chore_instances.json
  def index
    @chore_instances = ChoreInstance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chore_instances }
    end
  end

  # GET /chore_instances/1
  # GET /chore_instances/1.json
  def show
    @chore_instance = ChoreInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chore_instance }
    end
  end

  # GET /chore_instances/new
  # GET /chore_instances/new.json
  def new
    @chore_instance = ChoreInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chore_instance }
    end
  end

  # GET /chore_instances/1/edit
  def edit
    @chore_instance = ChoreInstance.find(params[:id])
  end

  # POST /chore_instances
  # POST /chore_instances.json
  def create
    @chore_instance = ChoreInstance.new(params[:chore_instance])

    respond_to do |format|
      if @chore_instance.save
        format.html { redirect_to @chore_instance, notice: 'Chore instance was successfully created.' }
        format.json { render json: @chore_instance, status: :created, location: @chore_instance }
      else
        format.html { render action: "new" }
        format.json { render json: @chore_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chore_instances/1
  # PUT /chore_instances/1.json
  def update
    @chore_instance = ChoreInstance.find(params[:id])

    respond_to do |format|
      if @chore_instance.update_attributes(params[:chore_instance])
        format.html { redirect_to @chore_instance, notice: 'Chore instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chore_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chore_instances/1
  # DELETE /chore_instances/1.json
  def destroy
    @chore_instance = ChoreInstance.find(params[:id])
    @chore_instance.destroy

    respond_to do |format|
      format.html { redirect_to chore_instances_url }
      format.json { head :no_content }
    end
  end
end
