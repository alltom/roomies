class Expense < ActiveRecord::Base
  belongs_to :payer, class_name: "Resident"
  has_many :expensed
end
