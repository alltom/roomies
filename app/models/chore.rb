class Chore < ActiveRecord::Base
  belongs_to :household
  
  validates :interval, numericality: { greater_than: 0 }
  validates :lead_time, numericality: { greater_than_or_equal_to: 0 }
  
  validate do
    errors.add(:lead_time, "must be less than the interval") unless lead_time < interval
  end
end
