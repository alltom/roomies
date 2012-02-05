class Resident < ActiveRecord::Base
  belongs_to :household
  belongs_to :user
  has_many :settlements, :foreign_key => "payer_id"
  has_many :expenses, :foreign_key => "payer_id"

  def balance_with resident
    balance = 0

    paid = expenses.each{|expense| expense.expensed}.flatten
    paid = paid.find_all{|expensed| expensed.resident == resident}
    paid.each do |expensed|
      balance += expensed.amount
    end

    givens = resident.expenses.each{|expense| expense.expensed}.flatten
    givens = givens.find_all{|given| given.resident == user}
    givens.each do |given|
      balance -= given.amount
    end

    puts settlements.first.to_s
    settlements.each do |settlement|
      if settlement.payer == self
        if settlement.payee == resident
          balance += settlement.amount
        end
      elsif settlement.payer == resident.user
             balance -= settlement.amount
      end
    end
    puts name + " with " + resident.name + " balance:" + balance.to_s
    return balance

    #BigDecimal.new("19.99")
  end

  def name
    user.name
  end
end
