class CommentsController < ApplicationController

  def create
    comment = Comment.new(comment_params)
    comment.image_id = params[:image_id]
    comment.user_id = current_user.id
    comment.save
    redirect_to galleries_path 
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
