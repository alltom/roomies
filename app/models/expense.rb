class Expense < ActiveRecord::Base
  belongs_to :payer, class_name: "Resident"
  has_many :expenseds
  
  accepts_nested_attributes_for :expenseds
end
