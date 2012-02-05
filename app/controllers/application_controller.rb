class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_resident
    current_user.residents.first # XXX
  end

end
