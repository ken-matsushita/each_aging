class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to admin_users_path
    else
      flash[:alert] = "更新に失敗しました。"
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:profile_image, :name, :account_name, :email, :introduction, :is_active)
  end
  
end
