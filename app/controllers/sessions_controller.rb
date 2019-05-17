class SessionsController < ApplicationController
  def new
  end

  def create
    session = params[:session]
    user = User.find_by(email: session[:email])
    if user && user.authenticate(session[:password])
      login user
      redirect_to forms_path
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