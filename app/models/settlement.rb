class Settlement < ActiveRecord::Base
  belongs_to :initiator, :class_name => "Resident"
  belongs_to :payer, :class_name => "Resident"
  belongs_to :payee, :class_name => "Resident"
  
  validate do
    errors.add(:amount, "must be a valid amount of money") unless amount && amount > 0
  end
end
