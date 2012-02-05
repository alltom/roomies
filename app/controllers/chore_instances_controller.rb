class ChoreInstancesController < ApplicationController
  def popup
    @chore_instance = ChoreInstance.find(params[:id])
    render layout: false
  end
end
