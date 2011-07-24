class UsuariosController < ApplicationController

  before_filter :forzar_login, :except=> ['login', 'logout']
  before_filter :find_proyecto, :except=>['login', 'logout']

  # GET /proyectos/:proyecto_id/usuarios
  def index
    @usuarios = @proyecto.usuario.all
  end

  # GET /proyectos/:proyecto_id/usuarios/1
  def show
    @usuario = @proyecto.usuario.find(params[:id])
  end

  # GET /proyectos/:proyecto_id/usuarios/new
  def new
    @usuario = @proyecto.usuario.new
  end

  # GET /proyectos/:proyecto_id/usuarios/1/edit
  def edit
    @usuario = @proyecto.usuario.find(params[:id])
  end

  # POST /proyectos/:proyecto_id/usuarios
  def create
    @usuario = @proyecto.usuario.new(params[:usuario])

    if @usuario.save
      flash[:success] = 'Usuario creado correctamente'
      redirect_to proyecto_usuario_path(@proyecto, @usuario)
    else
      render :action => "new"
    end
  end

  # PUT /proyectos/:proyecto_id/usuarios/1
  def update
    @usuario = @proyecto.usuario.find(params[:id])

    if @usuario.update_attributes(params[:usuario])
      flash[:success] = 'Usuario actualizado correctamente'
      redirect_to proyecto_usuario_path(@proyecto, @usuario)
    else
      render :action => "edit"
    end
  end

  # DELETE /proyectos/:proyecto_id/usuarios/1
  def destroy
    @usuario = @proyecto.usuario.find(params[:id])
    @usuario.destroy

    redirect_to(proyecto_usuarios_path)
  end

  # GET /login
  # POST /login
  def login
    if request.method == "POST"
      user = Usuario.find(:first, :conditions=>["username = ?", params[:username]])

      if user and user.login(params[:password])
        session[:usuario] = user
        if current_user.rol == "admin"
          redirect_to :controller=>'proyectos', :action=>'index'
        else
          redirect_to current_user.proyecto
        end
      else
        flash[:warning] = "Login unsuccessful"
        redirect_to :controller=>'usuarios', :action=>'login'
      end
    end
  end

  def logout
    session[:usuario] = nil
    redirect_to :controller=>'usuarios', :action=>'login'
  end

end
