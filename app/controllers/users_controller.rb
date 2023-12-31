class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @movies = @user.movies
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'ユーザー情報を更新しました。'
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end