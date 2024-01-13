class Public::PostImagesController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @post_image = PostImage.new
  end
  
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to user_path(current_user)
    else
      flash[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def show
  end

  def index
  end
  
  private
  
  def post_image_params
    params.require(:post_image).permit(:user_id, :genre_id, :name, :care, :years_passed, :body, :image)
  end
  
end
