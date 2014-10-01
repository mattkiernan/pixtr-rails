class GalleriesController < ApplicationController
 def index
   @galleries = Gallery.all
   render :index
 end 

 def new
   @gallery = Gallery.new
   render :new
 end

 def create
   gallery = Gallery.new(gallery_params)
   
   if gallery.save 
     redirect_to gallery_path(gallery) 
   else
     redirect_to root_path
   end

 end

 def show
   @gallery = load_gallery_from_url
 end

 def edit
   @gallery = load_gallery_from_url
   render :edit
 end

 def update
  gallery = load_gallery_from_url
  gallery.update(gallery_params)
  redirect_to gallery_path(gallery)
 end 
  
def destroy
  gallery = load_gallery_from_url
  gallery.destroy
  redirect_to "/"
end

def gallery_params
  params.require(:gallery).permit(:name, :description)
end

def load_gallery_from_url
  Gallery.find(params[:id])
end

end

