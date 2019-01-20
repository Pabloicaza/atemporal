class PhotosController < ApplicationController
  
  def destroy
		@photo = Photo.find(params[:id])
		proyecto = @photo.proyecto

		@photo.destroy
		@photos = Photo.where(proyecto_id: proyecto.id)

		respond_to :js
	end
end
