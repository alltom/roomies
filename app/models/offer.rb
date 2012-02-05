class Offer < ActiveRecord::Base
  belongs_to :offerer, :class_name => "Resident"
end
