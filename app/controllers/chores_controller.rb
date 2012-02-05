class ChoresController < ApplicationController
  def new
    @chore = Chore.new :name => "New Chore", :interval => 1, :lead_time => 0
  end

  def create
    @chore = Chore.new({ household: current_resident.household }.merge(params[:chore]))

    if @chore.save
      redirect_to root_url, notice: "Chore successfully created."
    else
      render action: "new"
    end
  end
end
