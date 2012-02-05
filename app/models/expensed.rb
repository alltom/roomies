class Expensed < ActiveRecord::Base
  belongs_to :expense
  belongs_to :resident
  
  attr_accessor :leftover_amount
  attr_accessor :exempt
  
  before_save do
    self.amount = self.amount.to_f
    if self.exempt == "0"
      self.amount += BigDecimal.new(leftover_amount)
    else
      self.amount = 0
    end
  end
end
