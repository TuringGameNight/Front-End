class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def current_user
    if session[:user]
      @current_user ||= User.new(session[:user])
    else
      redirect_to root_path
    end 
  end
end
