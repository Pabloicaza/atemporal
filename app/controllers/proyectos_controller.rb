class ProyectosController < ApplicationController
  def index
    @proyectos = Proyecto.all
  end

  def show
    @proyecto = Proyecto.find(params[:id])
  end

  def new
    @proyecto = Proyecto.new
  end

  def edit
     @proyecto = Proyecto.find(params[:id])
     @photos = @proyecto.photos
  end

  def create
    @proyecto = Proyecto.new(proyecto_params)
    if @proyecto.save
      if params[:images]
        params[:images].each do |image|
          @proyecto.photos.create(image: image)
        end
      end
      @photos = @proyecto.photos
      redirect_to @proyecto
    else
      render :new
    end
  end

  def update
    @proyecto = Proyecto.find(params[:id])
    if @proyecto.update(proyecto_params)
      if params[:images]
        params[:images].each do |image|
          @proyecto.photos.create(image: image)
        end
      end
      redirect_to @proyecto
    else
      render 'edit'
    end
  end

  def destroy
    @proyecto = Proyecto.find(params[:id])
    @proyecto.destroy

    redirect_to proyectos_path
  end

  private
    def proyecto_params
      params.require(:proyecto).permit(:nombre_proyecto, :tipo_proyecto, :ubicacion, :construccion, :terreno, :disponibilidad, :resumen)
    end
end
