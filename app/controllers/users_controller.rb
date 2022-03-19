class UsersController < ApplicationController

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user.id)
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def edit
　　@user = User.find(params[:id])
　　if @user == current_user
　　  render :edit
　　else
　　  redirect_to user_path(current_user)
　　end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profaile_image, :introduction)
  end
end
