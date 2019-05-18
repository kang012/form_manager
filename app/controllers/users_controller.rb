class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
    flash[:notice] = 'Account create successful'
    redirect_to login_path
  end

  def update
  end

  def show
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
