class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
  end

  def update
  end

  def show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end