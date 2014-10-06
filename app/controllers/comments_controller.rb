class CommentsController < ApplicationController

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    if @comment.save
      redirect_to gallery_image_path(@image.gallery, @image) 
    else
      @comments = @image.comments.recent 
      render "images/show"
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destory
    redirect_to gallery_image_path(@image.gallery, @image) 
  end

end
