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
   binding.pry
   Gallery.create(
     name: params[:gallery][:name],
     description: params[:gallery][:description]
   )
   redirect_to "/"
 end

 def show
   gallery_id = params[:id]
   @gallery = Gallery.find(gallery_id)
   render :show
 end

 def edit
   @gallery = Gallery.find(params[:id])
   render :edit
 end

 def update
  gallery= Gallery.find(params[:id])
  gallery.update(
    name: params[:gallery][:name],
    description: params[:gallery][:description]
  )
    redirect_to "/"
 end 
  
def destroy
  gallery = Gallery.find(params[:id])
  gallery.destroy
  redirect_to "/"
end

end
