class SessionsController < ApplicationController
  def new
  end

  def create
    session = params[:session]
    user = User.find_by(email: session[:email])
    if user && user.authenticate(session[:password])
      login user
      flash[:notice] = "Hello #{user.email} !!!"
      redirect_to user_forms_path current_user
    else
      flash[:notice] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = 'You has been logged out'
    redirect_to login_path
  end
end