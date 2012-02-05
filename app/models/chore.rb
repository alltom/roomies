class Chore < ActiveRecord::Base
  belongs_to :household
  
  validates :interval, numericality: { greater_than: 0 }
  validates :lead_time, numericality: { greater_than_or_equal_to: 0 }
  
  validate do
    errors.add(:lead_time, "must be less than the interval") unless lead_time < interval
  end

  @@ttl = 14

  def generate_chore_instances
    residents = Residents.all(sort_by{rand})
    res_index = 0
    res_size = residents.size
    length = @@ttl

    while length > 0
      ChoreInstance.create(:resident_id =>residents[res_index%res_size],
        :price => 0, :start => (start_date - lead_time.days), :end => start_date,
        :chore_id => self)
      length -= interval
  end

end
