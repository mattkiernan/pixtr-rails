class LikesController < ApplicationController

  def create 
    image = Image.find(params[:image_id])
    current_user.like(image)
    redirect_to gallery_image_path(image.gallery, image)
  end

  def destroy
    image = Image.find(params[:image_id])
    current_user.unlike_image(image)
    redirect_to gallery_image_path(image.gallery, image)
  end

end
