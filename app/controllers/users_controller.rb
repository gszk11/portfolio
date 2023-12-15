class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    
    if @user != current_user
      redirect_to user_path(current_user.id)
    end
  end
end