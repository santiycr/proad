class TareasController < ApplicationController

  before_filter :forzar_login
  before_filter :find_userstory

  # GET proyectos/:proyecto_id/userstories/:userstory_id/tareas
  def index
    @tareas = @us.tarea.all
  end

  # GET /tareas/1
  def show
    @tarea = @us.tarea.find(params[:id])
  end

  # GET /tareas/new
  def new
    @tarea = @us.tarea.new
  end

  # GET /tareas/1/edit
  def edit
    @tarea = @us.tarea.find(params[:id])
  end

  # POST /tareas
  def create
    @tarea = @us.tarea.new(params[:tarea])

    if @tarea.save
      flash[:success] = 'Tarea creada correctamente'
      redirect_to proyecto_userstory_tarea_path(@proyecto, @us, @tarea)
    else
      render :action => "new"
    end
  end

  # PUT /tareas/1
  def update
    @tarea = @us.tarea.find(params[:id])

    if @tarea.update_attributes(params[:tarea])
      flash[:success] = 'Tarea actualizada correctamente'
      redirect_to proyecto_userstory_tarea_path(@proyecto, @us, @tarea)
    else
      render :action => "edit"
    end
  end

  # DELETE /tareas/1
  def destroy
    @tarea = @us.tarea.find(params[:id])
    @tarea.destroy

    redirect_to(proyecto_userstory_tareas_path(@proyecto, @us))
  end
end
