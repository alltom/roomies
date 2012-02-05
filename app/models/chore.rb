class Chore < ActiveRecord::Base
  belongs_to :household
  
  validates :interval, numericality: { greater_than: 0 }
  validates :lead_time, numericality: { greater_than_or_equal_to: 0 }
  
  validate do
    errors.add(:lead_time, "must be less than the interval") unless lead_time < interval
  end
  
  after_create :generate_chore_instances

  @@ttl = 14

  def generate_chore_instances
    residents = Resident.all.sort_by{rand}
    res_index = 0
    res_size = residents.size
    length = @@ttl

    while length > 0
      ChoreInstance.create(:resident_id =>residents[res_index%res_size],
        :price => 0, :start_date => (start_date - lead_time.days), :end_date => start_date,
        :chore_id => self)
      length -= interval
      res_index += 1
      start_date+=interal.days
    end
  end

end
