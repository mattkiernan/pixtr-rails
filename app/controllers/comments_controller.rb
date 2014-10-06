class CommentsController < ApplicationController

  def create
    image = Image.find(params[:image_id])
    comment = Comment.new(comment_params)
    comment.image_id = params[:image_id]
    comment.user_id = current_user.id
    comment.save
    redirect_to gallery_image_path(image.gallery, image) 
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
