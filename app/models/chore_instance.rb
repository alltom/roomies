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
end
