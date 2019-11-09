class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  def tops
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: 'ユーザ登録完了'
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @user.id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @user.update(user_params)
    redirect_to root_path, info: 'ユーザ情報を更新しました'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
