class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :is_user

  def is_user
    redirect_to root_path if current_user.nil?
  end

  def current_user
    @current_user ||= User.new(session[:user]) unless session[:user].nil?
  end
end
