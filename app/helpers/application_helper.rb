module ApplicationHelper
  def nav_link(text, path)
    link_to(text, path, :class =>('current' if current_page? path))
  end

  def current_user
    session[:usuario]
  end

  def rol(permitido, no_admin=false)
    (current_user.rol == permitido or (current_user.rol == 'admin' and not no_admin))
  end
end
