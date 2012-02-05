class DashboardController < ApplicationController
  before_filter :authenticate_user!
  
  def current_resident
    current_user.residents.first # XXX
  end

  def index
      if not current_user
        render "login"
      else
        @residents = current_resident.household.residents
        @curRes = current_resident
      end
  end

end
