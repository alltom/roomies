class Resident < ActiveRecord::Base
  belongs_to :household
  belongs_to :user
  has_many :settlements_paid, :foreign_key => "payer_id"
  has_many :settlements_received, :foreign_key => "payee_id"
  has_many :expenses, :foreign_key => "payer_id"
  
  def settlements
    Settlement.where(["payee_id = ? or payer_id = ?", self, self])
  end
  
  def balance_with resident
    transactions = []
    transactions += Expensed.all.map { |e| [e.expense.payer, e.resident, e.amount] }
    transactions += Settlement.all.map { |s| [s.payer, s.payee, s.amount] }
    
    balance = 0
    transactions.each do |from, to, amount|
      if from == self && to == resident
        balance += amount
      elsif from == resident && to == self
        balance -= amount
      end
    end
    balance
  end

  def name
    user.name
  end
end
