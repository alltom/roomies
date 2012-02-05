class SettlementsController < ApplicationController
  def new
    @settlement = Settlement.new
  end

  def create
    @settlement = Settlement.new(params[:settlement])

    if @settlement.save
      redirect_to root_url, notice: "Settlement successfully logged."
    else
      render action: "new"
    end
  end
end
