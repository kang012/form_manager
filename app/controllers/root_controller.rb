class RootController < ApplicationController
  def index
    redirect_to user_forms_path current_user and return if current_user
      
    redirect_to login_path
  end
end
