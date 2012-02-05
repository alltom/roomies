class DashboardController < ApplicationController
  before_filter :authenticate_user!

  def current_resident
    current_user.residents.first # XXX
  end

  def index
      if not current_user
        render "login"
      else
        @cur_res = current_resident
        @residents = current_resident.household.residents
        @debtors, @debtees = @residents.partition{|resident|
          current_resident.balance_with(resident) > 0 }
      end
  end

end
