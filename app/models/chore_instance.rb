class ChoreInstance < ActiveRecord::Base
  belongs_to :chore
  belongs_to :resident
  has_many :offers

  def offer resident, price
    Offer.create do |o|
      o.price = price
      o.chore_instance = self
      o.offerer = resident
    end
  end

  def sell price
    self.price = price
  end

  def buy resident
  
    expense = Expense.create do |e|
      e.payer = resident
      e.amount = self.price
    end

    Expensed.create do |e|
      e.expense = expense
      e.resident = chore_instance.resident
      e.amount = price
    end

    self.price = 0
    chore_instance.resident = self.resident
    Offer.delete(chore_instance.offers)

  end

end
