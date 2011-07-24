class UserstoriesController < ApplicationController

  before_filter :forzar_login
  before_filter :find_proyecto

  # GET /proyectos/:proyecto_id/userstories
  # GET /proyectos/:proyecto_id/userstories.xml
  def index
    @userstories = @proyecto.userstory.all
  end

  # GET /proyectos/:proyecto_id/userstories/:id
  # GET /proyectos/1/userstories/1.xml
  def show
    @userstory = @proyecto.userstory.find(params[:id])
  end

  # GET /userstories/new
  # GET /userstories/new.xml
  def new
    @userstory = @proyecto.userstory.new
  end

  # GET /userstories/1/edit
  def edit
    @userstory = @proyecto.userstory.find(params[:id])
  end

  # POST /userstories
  # POST /userstories.xml
  def create
    @userstory = @proyecto.userstory.new(params[:userstory])

    if @userstory.save
      flash[:success] = 'User story creada correctamente'
      redirect_to proyecto_path(@proyecto)
    else
      render :action => "new"
    end
  end

  # PUT /userstories/1
  # PUT /userstories/1.xml
  def update
    @userstory = @proyecto.userstory.find(params[:id])

    if @userstory.update_attributes(params[:userstory])
      flash[:success] = 'User story actualizada correctamente'
      redirect_to proyecto_userstory_path(@proyecto, @userstory)
    else
      render :action => "edit"
    end
  end

  # DELETE /userstories/1
  # DELETE /userstories/1.xml
  def destroy
    @userstory = @proyecto.userstory.find(params[:id])
    @userstory.destroy

    redirect_to(proyecto_userstories_path)
  end
end
