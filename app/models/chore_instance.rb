class ChoreInstance < ActiveRecord::Base
  belongs_to :chore
  belongs_to :resident
end
