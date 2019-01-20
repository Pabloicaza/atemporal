class PagesController < ApplicationController
  def index
    @proyectos = Proyecto.all
  end
end
