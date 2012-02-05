module ApplicationHelper
  def current_resident
    current_user.residents.first # XXX
  end
end
