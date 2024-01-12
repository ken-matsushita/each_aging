# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def after_sign_in_path_for(resource)
    post_images_path
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  private
  
  def user_state
    user = User.find_by(email: params[:user][:email])#Userモデルの保存データの中から、フォームに入力されたemailに紐づく情報を取得する
    return if user.nil?#取得してきたUserのデータが存在するか、ないならメソッド終了
    return unless user.valid_password?(params[:user][:password])#取得したアカウントのパスワードと入力されたパスワードが不一致の場合、このメソッドを終了
    unless user.is_active == true#会員ステータスがtrueでないなら新規登録画面に戻る
      flash[:alert] = "すでに退会しています。"
      redirect_to new_user_registration_path
    end
  end
end
