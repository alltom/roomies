class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    current_resident.household.residents.each { |res| @expense.expenseds.build :resident => res }
  end

  def create
    @expense = Expense.new({ payer: current_resident }.merge(params[:expense]))

    if @expense.save
      redirect_to root_url, notice: "Expense successfully logged."
    else
      render action: "new"
    end
  end
end
