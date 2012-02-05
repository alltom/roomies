class Chore < ActiveRecord::Base
  belongs_to :household
  
  validates :interval, numericality: { greater_than: 0 }
  validates :lead_time, numericality: { greater_than_or_equal_to: 0 }
  
  validate do
    errors.add(:lead_time, "must be less than the interval") unless lead_time < interval
  end
  
  after_create :generate_chore_instances

  DAYS_TO_CREATE = 14

  def generate_chore_instances
    residents = household.residents.sort_by { rand }
    res_index = 0
    length = DAYS_TO_CREATE

    while length > 0
      ChoreInstance.create do |ci|
        ci.resident_id = residents[res_index % residents.length]
        ci.price = 0
        ci.start_date = (start_date - lead_time.days)
        ci.end_date = start_date
        ci.chore = self
      end
      length -= interval
      res_index += 1
      self.start_date += interval.days
    end
  end

end
