class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_resident
  
  def current_resident
    current_user.residents.first # XXX
  end
end
