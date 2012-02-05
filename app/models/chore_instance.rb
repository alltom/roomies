class ChoreInstance < ActiveRecord::Base
  belongs_to :chore
  belongs_to :resident
  has_many :offers
end
