module SettlementsHelper
  def other_residents
    current_resident.household.residents.all - [current_resident]
  end
end
