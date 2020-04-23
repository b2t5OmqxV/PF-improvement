class Users::UsersController < ApplicationController
  def index
    @categories = Category.all
    @users = User.all
    @notices = Notice.all
  end

  def show
    @user = User.find(params[:id])
    @appliances = @user.appliances
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(id: @user.id)
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :introduction, :profile_image, :gender)
  end
end
