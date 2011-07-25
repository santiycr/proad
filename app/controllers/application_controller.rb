class ApplicationController < ActionController::Base
  protect_from_forgery

  def find_proyecto
    @proyecto = Proyecto.find(params[:proyecto_id])
  end

  def find_userstory
    @proyecto = Proyecto.find(params[:proyecto_id])
    @userstory = @proyecto.userstory.find(params[:userstory_id])
  end

  def forzar_login
    if session[:usuario]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to :controller => "usuarios", :action => "login"
    return false 
  end

  def current_user
    session[:usuario]
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to_url(return_to)
    else
      redirect_to current_user.proyecto
    end
  end
  
end
