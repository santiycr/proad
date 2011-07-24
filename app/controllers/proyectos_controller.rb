class ProyectosController < ApplicationController

  before_filter :forzar_login

  # GET /proyectos
  # GET /proyectos.xml
  def index
    @proyectos = Proyecto.all
  end

  # GET /proyectos/1
  # GET /proyectos/1.xml
  def show
    @proyecto = Proyecto.find(params[:id])
    @us = @proyecto.userstory.all
    @us.sort! { |a,b| a.prioridad <=> b.prioridad }
  end

  # GET /proyectos/new
  # GET /proyectos/new.xml
  def new
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
    @proyecto = Proyecto.find(params[:id])
  end

  # POST /proyectos
  # POST /proyectos.xml
  def create
    @proyecto = Proyecto.new(params[:proyecto])

   if @proyecto.save
     flash[:success] = 'Proyecto creado correctamente'
     redirect_to @proyecto
   else
     render :action => "new"
   end
  end

  # PUT /proyectos/1
  # PUT /proyectos/1.xml
  def update
    @proyecto = Proyecto.find(params[:id])

    if @proyecto.update_attributes(params[:proyecto])
     flash[:success] = 'Proyecto actualizado correctamente'
      redirect_to @proyecto
    else
      render :action => "edit"
    end
  end

  # DELETE /proyectos/1
  # DELETE /proyectos/1.xml
  def destroy
    @proyecto = Proyecto.find(params[:id])
    @proyecto.destroy

    redirect_to(proyectos_url)
  end
end
