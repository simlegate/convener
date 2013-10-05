class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    session[:current_user] = auth
    redirect_to root_path
  end

  def destroy
    session[:current_user] = nil
    redirect_to root_path
  end
end
