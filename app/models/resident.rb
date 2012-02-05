class Resident < ActiveRecord::Base
  belongs_to :household
  belongs_to :user
  has_many :settlements
  has_many :expenses, :foreign_key => "payer_id"
  
  def balance_with resident
    BigDecimal.new("19.99")
  end
  
  def name
    user.name
  end
end
