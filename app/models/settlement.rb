class Settlement < ActiveRecord::Base
  belongs_to :initiator, :class_name => "Resident"
  belongs_to :payer, :class_name => "Resident"
  belongs_to :payee, :class_name => "Resident"
end
