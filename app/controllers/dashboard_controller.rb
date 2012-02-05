class DashboardController < ApplicationController
  before_filter :authenticate_user!


  def index
      if not current_user
        render "login"
      else
        @cur_res = current_resident
        @residents = current_resident.household.residents.find_all{|resident| 
        resident != @cur_res 
      }
        @debtors, @debtees = @residents.partition { |resident| current_resident.balance_with(resident) > 0 }
        @debtees.delete_if { |d| current_resident.balance_with(d) == 0 }

        @chores_for_sale = ChoreInstance.all.find_all{|ci| ci.price > 0}
      end
  end

end
