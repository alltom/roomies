class Expensed < ActiveRecord::Base
  belongs_to :expense
  belongs_to :resident
end
