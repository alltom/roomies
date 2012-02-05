class Chore < ActiveRecord::Base

  @@ttl = 14

  def generate_chore_instances
    residents = Residents.all(sort_by{rand})
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
