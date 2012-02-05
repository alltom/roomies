class Offer < ActiveRecord::Base
belongs_to :chore_instance

  def accept!
    expense = Expense.create do |e|
      e.payer = offerer
      e.amount = price
    end
    Expensed.create do |e|
      e.expense = expense
      e.resident = chore_instance.resident
      e.amount = price
    end

    chore_instance.resident = self.resident
    Offer.delete(chore_instance.offers)
  end

end
