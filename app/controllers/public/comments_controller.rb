class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    comment = current_user.comments.new(comment_params)
    comment.post_image_id = @post_image.id
    comment.save
  end

  def destroy
    Comment.find(params[:id]).destroy
    @post_image = PostImage.find(params[:post_image_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_image_id)
  end

end
