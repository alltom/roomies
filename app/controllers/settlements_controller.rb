class SettlementsController < ApplicationController
  def new
    @settlement = Settlement.new
    @residents = current_resident.household.residents.all - [current_resident]
  end

  def create
    @settlement = Settlement.new(params[:settlement])

    if @settlement.save
      redirect_to root_url, notice: "Settlement successfully logged."
    else
      render action: "new"
    end
  end
  
  def balance
    current_resident = current_user.residents.first
    @resident = current_resident.household.residents.find(params[:resident_id])
  end
end
