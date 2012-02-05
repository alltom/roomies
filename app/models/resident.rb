class Resident < ActiveRecord::Base
  belongs_to :household
  belongs_to :user
  has_many :settlements
  has_many :expenses
end
