class Resident < ActiveRecord::Base
  belongs_to :household
  belongs_to :user
  has_many :settlements
  has_many :expenses

  def balance_with resident
    balance = 0
    
    paid = expenses.each{|expense| expense.expensed}.flatten
    paid = paid.filter{|expensed| expensed.resident == resident}
    paid.each do |expensed|
      balance += expensed.amount
    end

    givens = Expensed.joins("expenses").where(
      "expenses.payer" => resident, "resident" => user)

    givens.each do |given|
      balance -= given.amount
    end

    settleds = Settlement.where(:payer => user, :payee => resident)
    settleds.each do |settled|
      balance += settled.amount
    end

    settles = Settlement.where(:payer => resident, :payee => user)
    settles.each do |settle|
      balance -= settle.amount
    end

    return balance

    #BigDecimal.new("19.99")
  end

  def name
    user.name
  end
end
