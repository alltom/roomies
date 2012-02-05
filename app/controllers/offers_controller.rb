class OffersController < ApplicationController
  def create
    @chore_instance = ChoreInstance.find(params[:offer][:chore_instance_id])
    @chore_instance.offer current_resident, params[:offer][:price]
    flash[:notice] = "Bid Sent!"
    redirect_to root_url
  end
end
