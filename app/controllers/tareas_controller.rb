class TareasController < ApplicationController

  before_filter :forzar_login
  before_filter :find_userstory

  # GET proyectos/:proyecto_id/userstories/:userstory_id/tareas
  def index
    @tareas = @userstory.tarea.all
  end

  # GET /tareas/1
  def show
    @tarea = @userstory.tarea.find(params[:id])
  end

  # GET /tareas/new
  def new
    @tarea = @userstory.tarea.new
  end

  # GET /tareas/1/edit
  def edit
    @tarea = @userstory.tarea.find(params[:id])
  end

  # POST /tareas
  def create
    @tarea = @userstory.tarea.new(params[:tarea])

    if @tarea.save
      flash[:success] = 'Tarea creada correctamente'
      redirect_to proyecto_userstory_tarea_path(@proyecto, @userstory, @tarea)
    else
      render :action => "new"
    end
  end

  # PUT /tareas/1
  def update
    @tarea = @userstory.tarea.find(params[:id])

    if @tarea.update_attributes(params[:tarea])
      flash[:success] = 'Tarea actualizada correctamente'
      redirect_to proyecto_userstory_tarea_path(@proyecto, @userstory, @tarea)
    else
      render :action => "edit"
    end
  end

  # DELETE /tareas/1
  def destroy
    @tarea = @userstory.tarea.find(params[:id])
    @tarea.destroy

    redirect_to(proyecto_userstory_tareas_path(@proyecto, @userstory))
  end
end
